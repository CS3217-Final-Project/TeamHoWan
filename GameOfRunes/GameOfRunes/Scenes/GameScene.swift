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
    private lazy var maximumUpdateDeltaTime: TimeInterval = { 1 / .init((view?.preferredFramesPerSecond ?? 60)) }()
    private weak var gameStateMachine: GameStateMachine?
    
    // layers
    private(set) var backgroundLayer: SKNode!
    private(set) var enemyLayer: SKNode!
    private(set) var powerUpAnimationLayer: SKNode!
    private(set) var playerAreaLayer: SKNode!
    private(set) var manaDropLayer: SKNode!
    private(set) var gestureLayer: SKNode!
    private(set) var highestPriorityLayer: SKNode!
    let manaLabel = SKLabelNode(fontNamed: "DragonFire")
    var backgroundNode: SKSpriteNode!
    var playerAreaNode: PlayerAreaNode!
    var bgmNode: SKAudioNode!

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        registerForPauseNotifications()
    }

    deinit {
        unregisterNotifications()
        print("deinit game scene")
    }
        
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        // must use other thread queues (not .main) to avoid deadlocks
        DispatchQueue.global(qos: .default).async {
            TextureContainer.loadTextures()
            dispatchGroup.leave()
        }
        
        PowerUpType.loadPowerUpCastsTextures()
        
        // continue setting up other stuff in .main thread
        gameEngine = GameEngine(gameScene: self, gameStateMachine: gameStateMachine)
        setUpLayers()
        
        setUpArenaLayout()
        setUpEndPoint()
        setUpHealth()
        setUpMana()
        setUpPauseButton()
        bgmNode = .init(fileNamed: "Lion King Eldigan")
        
        // ensures textures have been loaded
        dispatchGroup.wait()
    }
    
    override func didMove(to view: SKView) {
        addChild(bgmNode)
    }
    
    override func willMove(from view: SKView) {
        super.willMove(from: view)
        
        bgmNode.removeFromParent()
    }
    
    private func setUpLayers() {
        backgroundLayer = .init()
        backgroundLayer.zPosition = GameConfig.GamePlayScene.backgroundLayerZPosition
        
        enemyLayer = .init()
        enemyLayer.zPosition = GameConfig.GamePlayScene.enemyLayerZPosition
        
        powerUpAnimationLayer = .init()
        powerUpAnimationLayer.zPosition = GameConfig.GamePlayScene.enemyLayerZPosition
        
        playerAreaLayer = .init()
        playerAreaLayer.zPosition = GameConfig.GamePlayScene.playerAreaLayerZPosition
        
        manaDropLayer = .init()
        manaDropLayer.zPosition = GameConfig.GamePlayScene.manaDropLayerZPosition
        
        gestureLayer = .init()
        gestureLayer.zPosition = GameConfig.GamePlayScene.gestureLayerZPosition
        
        highestPriorityLayer = .init()
        highestPriorityLayer.zPosition = GameConfig.GamePlayScene.highestPriorityLayerZPosition
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
        addChild(backgroundNode)

        let gestureAreaNode = GestureAreaNode(size: size, gameEngine: gameEngine)
        addChild(gestureAreaNode)

        // Add player area
        let playerAreaWidth = size.width
        let playerAreaHeight = size.height / 5
        playerAreaNode = .init(
            size: .init(width: playerAreaWidth, height: playerAreaHeight),
            position: .init(x: playerAreaWidth / 2, y: playerAreaHeight / 2)
        )
        playerAreaNode.zPosition = 200
        addChild(playerAreaNode)
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
        addChild(manaLabel)
    }
    
    override func update(_ currentTime: TimeInterval) {
        var deltaTime = currentTime - lastUpdateTime
        deltaTime = deltaTime > maximumUpdateDeltaTime ? maximumUpdateDeltaTime : deltaTime
        lastUpdateTime = currentTime

        gameEngine.update(with: deltaTime)
/*
        if let playerHealthComponent =
            gameEngine.playerHealthEntity?.component(ofType: HealthComponent.self) {
            playerAreaNode.healthBarNode.livesLeft = playerHealthComponent.healthPoints
        }
        
        if let playerManaComponent =
            gameEngine.playerManaEntity?.component(ofType: ManaComponent.self) {
            manaLabel.text = "\(playerManaComponent.manaPoints)"
            playerAreaNode.manaBarNode.currentManaPoints = playerManaComponent.manaPoints
        }
 */
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
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
extension GameScene: TapResponder {
    private func setUpPauseButton() {
        let buttonMargin = GameConfig.GamePlayScene.buttonMargin
        let buttonSize = CGSize(
            width: size.width * GameConfig.GamePlayScene.buttonWidthRatio,
            height: size.width * GameConfig.GamePlayScene.buttonHeightRatio
        )
        let pauseButton = ButtonNode(
            size: buttonSize,
            position: .init(x: frame.maxX, y: frame.maxY)
                + .init(dx: -buttonSize.width / 2, dy: -buttonSize.height / 2)
                + .init(dx: -buttonMargin, dy: -buttonMargin),
            texture: .init(imageNamed: ButtonType.pauseButton.rawValue),
            name: ButtonType.pauseButton.rawValue
        )
        pauseButton.zPosition = 1000
        addChild(pauseButton)
    }

    func onTapped(tappedNode: SKSpriteNode) {
        switch tappedNode.name {
        case ButtonType.pauseButton.rawValue:
            gameStateMachine?.enter(GamePauseState.self)
        case ButtonType.summonButton.rawValue:
            gameEngine.spawnEnemy()
        default:
            print("Unknown node tapped")
        }
    }
}

/** Pause Game when the application becomes inactive */
extension GameScene {
    private func registerForPauseNotifications() {
        let pauseNotificationName = UIApplication.willResignActiveNotification
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(pauseGame),
            name: pauseNotificationName,
            object: nil
        )
    }

    @objc private func pauseGame() {
        gameStateMachine?.enter(GamePauseState.self)
    }

    private func unregisterNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
}
