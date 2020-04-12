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
    private let backNode: BackNode = .init()
    private let startViewNode: SKNode = .init()
    private let gameModeSelectionViewNode: SKNode = .init()
    private let multiplayerActionViewNode: SKNode = .init()
    private let joinRoomViewNode: SKNode = .init()
    private let hostRoomViewNode: SKNode = .init()
    private weak var currentViewNode: SKNode?
    private var navigationStack: [SKNode] = [] {
        didSet {
            backNode.isHidden = navigationStack.isEmpty
        }
    }
    
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
        setUpBackButton()
        setUpStartView()
        setUpGameModeSelectionView()
        setUpMultiplayerActionView()
        setUpJoinRoomView()
        
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
            navigationStack.append(startViewNode)
            currentViewNode = gameModeSelectionViewNode
        case .singlePlayerButton:
            gameStateMachine?.enter(GameStageSelectionState.self)
        case .multiplayerButton:
            transit(from: gameModeSelectionViewNode, to: multiplayerActionViewNode)
            navigationStack.append(gameModeSelectionViewNode)
            currentViewNode = multiplayerActionViewNode
        case .backButton:
            guard let currentViewNode = currentViewNode, let previousViewNode = navigationStack.popLast() else {
                return
            }
            transit(from: currentViewNode, to: previousViewNode)
            self.currentViewNode = previousViewNode
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
    
    private func setUpBackButton() {
        backNode.size = backNode.size.scaleTo(width: size.width / 7)
        backNode.position = .init(
            x: -size.width / 2 + backNode.size.width / 1.5,
            y: size.height / 2 - backNode.size.height / 1.5
        )
        backNode.isHidden = true
        uiLayer.addChild(backNode)
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
            size: singlePlayerButtonTexture.size().scaleTo(width: size.width * 0.4),
            texture: singlePlayerButtonTexture,
            buttonType: .singlePlayerButton,
            position: .init(x: 0.0, y: size.height * 0.2)
        )
        
        let multiplayerButtonTexture = SKTexture(imageNamed: "multiplayer-button")
        let multiplayerButton = ButtonNode(
            size: multiplayerButtonTexture.size().scaleTo(width: size.width * 0.4),
            texture: multiplayerButtonTexture,
            buttonType: .multiplayerButton,
            position: .init(x: 0.0, y: -size.height * 0.2)
        )
        
        gameModeSelectionViewNode.addChild(singlePlayerButton)
        gameModeSelectionViewNode.addChild(multiplayerButton)
        gameModeSelectionViewNode.alpha = .zero
        uiLayer.addChild(gameModeSelectionViewNode)
    }
    
    private func setUpMultiplayerActionView() {
        let hostRoomButtonTexture = SKTexture(imageNamed: "host-room-button")
        let hostRoomButton = ButtonNode(
            size: hostRoomButtonTexture.size().scaleTo(height: size.width * 0.4),
            texture: hostRoomButtonTexture,
            buttonType: .hostRoomButton,
            position: .init(x: -size.width * 0.225, y: 0.0)
        )
        
        let joinRoomButtonTexture = SKTexture(imageNamed: "join-room-button")
        let joinRoomButton = ButtonNode(
            size: joinRoomButtonTexture.size().scaleTo(height: size.width * 0.4),
            texture: joinRoomButtonTexture,
            buttonType: .joinRoomButton,
            position: .init(x: size.width * 0.225, y: 0.0)
        )
        
        multiplayerActionViewNode.addChild(hostRoomButton)
        multiplayerActionViewNode.addChild(joinRoomButton)
        multiplayerActionViewNode.alpha = .zero
        uiLayer.addChild(multiplayerActionViewNode)
    }
    
    private func setUpJoinRoomView() {
        
    }
}
