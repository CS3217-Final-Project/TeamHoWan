//
//  GameScene.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, ControlledByGameStateMachine {
    private var entityManager: EntityManager!
    private var lastUpdateTime: TimeInterval = 0.0
    var gameStateMachine: GameStateMachine
    let manaLabel = SKLabelNode(fontNamed: "DragonFire")
    var manaBarNode: ManaBarNode!
    private var pauseButton: ButtonNode!

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func sceneDidLoad() {
        entityManager = .init(scene: self, gameStateMachine: gameStateMachine)
        
        setUpArenaLayout()
        setUpEndPoint()
        setUpHealthBar()
        setUpHealth()
        setUpManaBar()
        setUpMana()
        setUpPauseButton()
    }
    
    private func setUpArenaLayout() {
        let backgroundEntity = BackgroundEntity(arenaType: .arena2)
        let playerAreaEntity = PlayerAreaEntity()
        
        if let spriteComponent = backgroundEntity.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = .init(x: size.width / 2, y: size.height / 2)
            spriteComponent.node.size = size
            spriteComponent.node.zPosition = -1
            spriteComponent.node.name = "background"
        }
        
        if let spriteComponent = playerAreaEntity.component(ofType: SpriteComponent.self) {
            let newSpriteWidth = size.width
            let newSpriteHeight = size.height / 6
            spriteComponent.node.size = .init(width: newSpriteWidth, height: newSpriteHeight)
            spriteComponent.node.position = .init(
                x: newSpriteWidth / 2,
                y: newSpriteHeight / 2
            )
            spriteComponent.node.zPosition = 1
            spriteComponent.node.name = "player area"
        }
        
        entityManager.add(backgroundEntity)
        entityManager.add(playerAreaEntity)
    }
    
    private func setUpEndPoint() {
        let endPointEntity = EndPointEntity(entityManger: entityManager)
        
        if let spriteComponent = endPointEntity.component(ofType: SpriteComponent.self),
            let playerAreaNode = scene?.childNode(withName: "player area") {
            let newSpriteWidth = size.width
            let newSpriteHeight = size.height / 40
            spriteComponent.node.size = .init(width: newSpriteWidth, height: newSpriteHeight)
            spriteComponent.node.position = playerAreaNode.position
                + .init(dx: 0.0, dy: (playerAreaNode.frame.size.height + newSpriteHeight) / 2)
            spriteComponent.node.zPosition = 1
        }
        
        entityManager.add(endPointEntity)
    }
    
    private func setUpHealthBar() {
        guard let playerAreaNode = scene?.childNode(withName: "player area") else {
            return
        }
        
        let healthBarNode = HealthBarNode(totalLives: 3)
        let playerAreaSize = playerAreaNode.frame.size
        healthBarNode.size = playerAreaSize.applying(.init(scaleX: 0.45, y: 0.4))
        healthBarNode.position = playerAreaNode.position
            + .init(dx: -playerAreaSize.width / 4.5, dy: playerAreaSize.height / 4.5)
        healthBarNode.zPosition = 100
        addChild(healthBarNode)
    }

    private func setUpHealth() {
        entityManager.add(PlayerHealthEntity())
    }

    private func setUpManaBar() {
        guard let playerAreaNode = scene?.childNode(withName: "player area") else {
            return
        }

        let manaBarNode = ManaBarNode(numManaUnits: 5, manaPointsPerUnit: 10)
        let playerAreaSize = playerAreaNode.frame.size
        manaBarNode.size = playerAreaSize.applying(.init(scaleX: 0.45, y: 0.4))
        manaBarNode.position = playerAreaNode.position
            + .init(dx: playerAreaSize.width / 4.5, dy: playerAreaSize.height / 4.5)
        manaBarNode.zPosition = 100
        self.manaBarNode = manaBarNode
        addChild(manaBarNode)
    }

    private func setUpMana() {
        entityManager.add(PlayerManaEntity())
        
        manaLabel.fontSize = 50
        manaLabel.fontColor = SKColor.white
        manaLabel.position = CGPoint(x: size.width / 2, y: 50)
        manaLabel.zPosition = 3
        manaLabel.horizontalAlignmentMode = .center
        manaLabel.verticalAlignmentMode = .center
        manaLabel.text = "0"
        addChild(manaLabel)
    }

    func removeMonstersWithGesture(gesture: CustomGesture) {
        entityManager.removeMonstersWithGesture(gesture: gesture)
    }
    
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = currentTime - lastUpdateTime
        lastUpdateTime = currentTime

        entityManager.update(with: deltaTime)
        
        if let manaEntity = entityManager
            .entities
            .compactMap({ $0.component(ofType: ManaComponent.self) })
            .first {
            manaLabel.text = "\(manaEntity.manaPoints)"
            manaBarNode.currentManaPoints = manaEntity.manaPoints
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //TODO: Delete the following line when Monster-Endpoint collision code is pulled from master
//        entityManager.decreasePlayerHealth()
        entityManager.spawnEnemy()
    }
}

/**
 Extension to deal with button-related logic (i.e. the Pause Button)
 */
extension GameScene: ButtonNodeResponderType {
    private func setUpPauseButton() {
        let buttonSize = CGSize(width: GameplayConfiguration.GamePlayScene.buttonWidth,
                                height: GameplayConfiguration.GamePlayScene.buttonHeight)
        let buttonPosition = CGPoint(x: frame.maxX -
                                        CGFloat(GameplayConfiguration.GamePlayScene.buttonWidth/2),
                                     y: frame.maxY -
                                        CGFloat(GameplayConfiguration.GamePlayScene.buttonHeight/2))
        let pauseButton = ButtonNode(size: buttonSize,
                                     position: buttonPosition,
                                     texture: SKTexture(imageNamed: "pauseButton"),
                                     name: "pauseButton")
        self.pauseButton = pauseButton
        addChild(pauseButton)
    }

    func buttonPressed(button: ButtonNode) {
        if button.name == "pauseButton" {
            gameStateMachine.enter(GamePauseState.self)
        }
    }
}

/** Pause Game when the application becomes inactive */
extension GameScene {
    func registerForPauseNotifications() {
        let pauseNotificationName = UIApplication.willResignActiveNotification
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(GameScene.pauseGame),
                                               name: pauseNotificationName,
                                               object: nil)
    }

    @objc func pauseGame() {
        gameStateMachine.enter(GamePauseState.self)
    }

    func unregisterForPauseNotifications() {
        let pauseNotificationName = UIApplication.willResignActiveNotification
        NotificationCenter.default.removeObserver(self, name: pauseNotificationName, object: nil)
    }
}
