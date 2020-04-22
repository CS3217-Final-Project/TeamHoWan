//
//  MultiplayerGameEndScene.swift
//  GameOfRunes
//
//  Created by Jermy on 21/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
/**
 Scene to be displayed when the multiplayer game has ended (i.e. either win or lose
 condition has been reached).
 */
class MultiplayerGameEndScene: SKScene, TapResponder {
    // initialise with placeholder value
    var didWin = true
    private weak var gameStateMachine: GameStateMachine?
    private let statusLabel = SKLabelNode(fontNamed: GameConfig.fontName)

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        
        anchorPoint = .init(x: 0.5, y: 0.5)

        let homeButton = ButtonNode(
            size: .init(width: size.width * GameConfig.MultiplayerGameEndScene.buttonWidthRatio,
                        height: size.width * GameConfig.MultiplayerGameEndScene.buttonHeightRatio),
            texture: .init(imageNamed: "home-button"),
            buttonType: .homeButton
        )
        
        addChild(homeButton)
        
        statusLabel.fontSize = size.width * GameConfig.MultiplayerGameEndScene.fontSizeRatio
        statusLabel.fontColor = .white
        statusLabel.position = .init(x: 0.0, y: homeButton.size.height / 1.5)
        addChild(statusLabel)
    }
    
    deinit {
        print("deinit game end scene")
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        statusLabel.text = didWin ? "You Won!" : "You Lost :("
    }

    func onTapped(tappedNode: ButtonNode) {
        switch tappedNode.buttonType {
        case .homeButton:
            gameStateMachine?.enter(GameModeSelectionState.self)
        default:
            print("Unknown node tapped:", tappedNode)
        }
    }
}
