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
    var playerAreaNode: PlayerAreaNode!
    private var pauseButton: ButtonNode!

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        registerForPauseNotifications()
    }

    deinit {
        unregisterForPauseNotifications()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {
        entityManager = .init(scene: self, gameStateMachine: gameStateMachine)
        
        setUpArenaLayout()
        setUpEndPoint()
        setUpHealth()
        setUpMana()
        setUpPauseButton()
    }
    
    private func setUpArenaLayout() {
        // Add background
        let backgroundNode = SKSpriteNode(
            texture: .init(imageNamed: ArenaType.arena2.rawValue),
            color: .clear,
            size: size
        )
        backgroundNode.position = .init(x: size.width / 2, y: size.height / 2)
        backgroundNode.zPosition = -1
        addChild(backgroundNode)
        
        // Add player area
        let playerAreaWidth = size.width
        let playerAreaHeight = size.height / 6
        playerAreaNode = .init(
            size: .init(width: playerAreaWidth, height: playerAreaHeight),
            position: .init(x: playerAreaWidth / 2, y: playerAreaHeight / 2)
        )
        playerAreaNode.zPosition = 100
        addChild(playerAreaNode)
    }
    
    private func setUpEndPoint() {
        let endPointEntity = EndPointEntity(entityManger: entityManager)
        
        if let spriteComponent = endPointEntity.component(ofType: SpriteComponent.self) {
            let newSpriteWidth = size.width
            let newSpriteHeight = size.height / 40
            spriteComponent.node.size = .init(width: newSpriteWidth, height: newSpriteHeight)
            spriteComponent.node.position = playerAreaNode.position
                + .init(dx: 0.0, dy: (playerAreaNode.size.height + newSpriteHeight) / 2)
            spriteComponent.node.zPosition = playerAreaNode.zPosition
        }
        
        entityManager.add(endPointEntity)
    }
    
    private func setUpHealth() {
        let playerHealthEntity = PlayerHealthEntity()
        if let healthComponent = playerHealthEntity.component(ofType: HealthComponent.self) {
            let healthBarNode = playerAreaNode.healthBarNode
            healthBarNode.totalLives = healthComponent.healthPoints
            healthBarNode.livesLeft = healthComponent.healthPoints
        }
        entityManager.add(PlayerHealthEntity())
    }
    
    private func setUpMana() {
        entityManager.add(PlayerManaEntity())
        
        manaLabel.fontSize = 50
        manaLabel.fontColor = SKColor.white
        manaLabel.position = CGPoint(x: size.width / 2, y: 50)
        manaLabel.zPosition = 200
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
        
        if let healthEntity = entityManager
            .entities
            .compactMap({ $0.component(ofType: HealthComponent.self) })
            .first {
            playerAreaNode.healthBarNode.livesLeft = healthEntity.healthPoints
        }
        
        if let manaEntity = entityManager
            .entities
            .compactMap({ $0.component(ofType: ManaComponent.self) })
            .first {
            manaLabel.text = "\(manaEntity.manaPoints)"
            playerAreaNode.manaBarNode.currentManaPoints = manaEntity.manaPoints
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
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
