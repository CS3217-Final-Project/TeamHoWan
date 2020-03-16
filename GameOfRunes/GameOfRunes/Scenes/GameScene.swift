//
//  GameScene.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    private var gameEngine: GameEngine!
    private var lastUpdateTime: TimeInterval = 0.0
    private let maximumUpdateDeltaTime: TimeInterval = 1.0 / 60.0
    var gameStateMachine: GameStateMachine
    let manaLabel = SKLabelNode(fontNamed: "DragonFire")
    var backgroundNode: SKSpriteNode!
    var playerAreaNode: PlayerAreaNode!
    var bgmNode: SKAudioNode?
    private var pauseButton: ButtonNode!
    
    let worldNode = SKNode()

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        registerForPauseNotifications()
    }

    deinit {
        unregisterForPauseNotifications()
        print("deinit game scene")
    }
        
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {
        gameEngine = GameEngine(scene: self, gameStateMachine: gameStateMachine)
        PowerUpType.loadPowerUpCastsTextures()
        TextureContainer.loadTextures()
        setUpArenaLayout()
        setUpEndPoint()
        setUpHealth()
        setUpMana()
        setUpPauseButton()
    }
    
    override func didMove(to view: SKView) {
        bgmNode?.removeFromParent()
        worldNode.removeFromParent()
        let newBgmNode = SKAudioNode(fileNamed: "Lion King Eldigan")
        bgmNode = newBgmNode
        addChild(newBgmNode)
        worldNode.name = "world"
        addChild(worldNode)
    }
    
    func addNode(_ node: SKNode) {
        worldNode.addChild(node)
    }
    
    private func setUpArenaLayout() {
        // Add background
        backgroundNode = .init(
            texture: ArenaType.allCases.randomElement()?.texture ?? .init(),
            color: .clear,
            size: size
        )
        backgroundNode.position = .init(x: size.width / 2, y: size.height / 2)
        backgroundNode.zPosition = -100
        addNode(backgroundNode)

        let gestureAreaNode = GestureAreaNode(size: size, gameEngine: gameEngine)
        addNode(gestureAreaNode)

        // Add player area
        let playerAreaWidth = size.width
        let playerAreaHeight = size.height / 6
        playerAreaNode = .init(
            size: .init(width: playerAreaWidth, height: playerAreaHeight),
            position: .init(x: playerAreaWidth / 2, y: playerAreaHeight / 2)
        )
        playerAreaNode.zPosition = 200
        addNode(playerAreaNode)
    }
    
    private func setUpEndPoint() {
        let endPointEntity = EndPointEntity(gameEngine: gameEngine)
        
        if let spriteComponent = endPointEntity.component(ofType: SpriteComponent.self) {
            let newSpriteWidth = size.width
            let newSpriteHeight = size.height / 40
            spriteComponent.node.size = .init(width: newSpriteWidth, height: newSpriteHeight)
            spriteComponent.node.position = playerAreaNode.position
                + .init(dx: 0.0, dy: (playerAreaNode.size.height + newSpriteHeight) / 2)
            spriteComponent.node.zPosition = 100
        }
        
        gameEngine.add(endPointEntity)
    }
    
    private func setUpHealth() {
        let playerHealthEntity = PlayerHealthEntity()
        if let healthComponent = playerHealthEntity.component(ofType: HealthComponent.self) {
            let healthBarNode = playerAreaNode.healthBarNode
            healthBarNode.totalLives = healthComponent.healthPoints
            healthBarNode.livesLeft = healthComponent.healthPoints
        }
        gameEngine.add(playerHealthEntity)
    }
    
    private func setUpMana() {
        gameEngine.add(PlayerManaEntity())
        
        manaLabel.fontSize = 50
        manaLabel.fontColor = SKColor.white
        manaLabel.position = CGPoint(x: size.width / 2, y: 50)
        manaLabel.zPosition = 300
        manaLabel.horizontalAlignmentMode = .center
        manaLabel.verticalAlignmentMode = .center
        manaLabel.text = "0"
        addNode(manaLabel)
    }
    
    override func update(_ currentTime: TimeInterval) {
        var deltaTime = currentTime - lastUpdateTime
        deltaTime = deltaTime > maximumUpdateDeltaTime ? maximumUpdateDeltaTime : deltaTime

        gameEngine.update(with: deltaTime)
        

        if let playerHealthComponent =
            gameEngine.playerHealthEntity?.component(ofType: HealthComponent.self) {
            playerAreaNode.healthBarNode.livesLeft = playerHealthComponent.healthPoints
        }
        
        if let playerManaComponent =
            gameEngine.playerManaEntity?.component(ofType: ManaComponent.self) {
            manaLabel.text = "\(playerManaComponent.manaPoints)"
            playerAreaNode.manaBarNode.currentManaPoints = playerManaComponent.manaPoints
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        gameEngine.spawnEnemy()
        playerAreaNode.powerUpContainerNode.selectedPowerUp?.runAnimation(
            at: touch.location(in: self),
            with: .init(width: size.width / 3, height: size.width / 3),
            on: self
        )
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
        pauseButton.zPosition = 100
        self.pauseButton = pauseButton
        addNode(pauseButton)
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
