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
        
        addChild(bgmNode)
    }
}

// MARK: - Tap Responder
extension GameHomeScene: TapResponder {
    func onTapped(tappedNode: ButtonNode) {
        switch tappedNode.buttonType {
        case .startButton:
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
}
