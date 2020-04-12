//
//  GameHomeScene.swift
//  GameOfRunes
//
//  Created by Jermy on 12/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class GameHomeScene: SKScene {
    private weak var gameStateMachine: GameStateMachine?
    private let startViewNode: SKNode = .init()
    private let gameModeSelectionViewNode: SKNode = .init()
    
    // layers
    private let backgroundLayer: SKNode = .init()
    private let uiLayer: SKNode = .init()
    
    private let bgmNode: SKAudioNode = .init(fileNamed: "Destiny-Ablaze")
    
    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        
        anchorPoint = .init(x: 0.5, y: 0.5)
    }
    
    deinit {
        print("deinit game home scene")
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        buildLayers()
        setUpBackground()
        setUpStartView()
        setUpGameModeSelectionView()
        
        addChild(bgmNode)
    }
    
    private func transit(from nodeA: SKNode, to nodeB: SKNode) {
        nodeA.run(.fadeOut(withDuration: 0.25)) {
            nodeB.run(.fadeIn(withDuration: 0.25))
        }
    }
}

// MARK: - Tap Responder
extension GameHomeScene: TapResponder {
    func onTapped(tappedNode: ButtonNode) {
        switch tappedNode.buttonType {
        case .startButton:
            transit(from: startViewNode, to: gameModeSelectionViewNode)
        case .singlePlayerButton:
            gameStateMachine?.enter(GameStageSelectionState.self)
        case .multiplayerButton:
            gameStateMachine?.enter(GameStageSelectionState.self)
        default:
            print("Unknown node tapped:", tappedNode)
        }
    }
}

// MARK: - Scene setup
extension GameHomeScene {
    private func buildLayers() {
        backgroundLayer.zPosition = GameConfig.GameHomeScene.backgroundLayerZPosition
        addChild(backgroundLayer)
        
        uiLayer.zPosition = GameConfig.GameHomeScene.uiLayerZPosition
        addChild(uiLayer)
    }
    
    private func setUpBackground() {
        let backgroundNode = SKSpriteNode(
            texture: .init(imageNamed: "relic-guardian"),
            color: .clear,
            size: size
        )
        
        backgroundNode.aspectFillToSize(fillSize: size)
        backgroundLayer.addChild(backgroundNode)
    }
    
    private func setUpStartView() {
        let gameIconTexture = SKTexture(imageNamed: "GameOfRunes-logo-transparent")
        let gameIcon = SKSpriteNode(
            texture: gameIconTexture,
            size: gameIconTexture.size().scaleTo(width: size.width * 0.8)
        )
        gameIcon.position = .init(x: 0.0, y: size.height * 0.125)
        
        let buttonTexture = SKTexture(imageNamed: "start-button-glow")
        let startButton = ButtonNode(
            size: buttonTexture.size().scaleTo(width: size.width * 0.8),
            texture: buttonTexture,
            buttonType: .startButton,
            position: .init(x: 0.0, y: -size.height * 0.3)
        )
        
        startViewNode.addChild(gameIcon)
        startViewNode.addChild(startButton)
        uiLayer.addChild(startViewNode)
    }
    
    private func setUpGameModeSelectionView() {
        let singlePlayerButtonTexture = SKTexture(imageNamed: "single-player-button")
        let singlePlayerButton = ButtonNode(
            size: singlePlayerButtonTexture.size().scaleTo(width: size.width * 0.7),
            texture: singlePlayerButtonTexture,
            buttonType: .singlePlayerButton,
            position: .init(x: 0.0, y: size.height * 0.125)
        )
        
        let multiplayerButtonTexture = SKTexture(imageNamed: "multiplayer-button")
        let multiplayerButton = ButtonNode(
            size: multiplayerButtonTexture.size().scaleTo(width: size.width * 0.7),
            texture: multiplayerButtonTexture,
            buttonType: .multiplayerButton,
            position: .init(x: 0.0, y: -size.height * 0.225)
        )
        
        gameModeSelectionViewNode.addChild(singlePlayerButton)
        gameModeSelectionViewNode.addChild(multiplayerButton)
        gameModeSelectionViewNode.alpha = .zero
        uiLayer.addChild(gameModeSelectionViewNode)
    }
}
