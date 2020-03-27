//
//  GameEndScene.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/**
 Scene to be displayed when the game has ended (i.e. either win or lose
 condition has been reached).
 */
class GameEndScene: SKScene, TapResponder {
    // initialise with placeholder value
    var didWin = true
    private weak var gameStateMachine: GameStateMachine?
    private let statusLabel = SKLabelNode()

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        
        let center = CGPoint(x: frame.midX, y: frame.midY)
        
        let restartButton = ButtonNode(
            size: .init(width: size.width * GameConfig.GameEndScene.buttonWidthRatio,
                        height: size.width * GameConfig.GameEndScene.buttonHeightRatio),
            texture: .init(imageNamed: ButtonType.restartButton.rawValue),
            buttonType: .restartButton,
            position: center
        )
        
        addChild(restartButton)
        
        statusLabel.fontName = GameConfig.fontName
        statusLabel.fontSize = size.width * GameConfig.GameEndScene.fontSizeRatio
        statusLabel.fontColor = .white
        statusLabel.position = center + .init(dx: 0.0, dy: restartButton.size.height / 1.5)
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
        statusLabel.text = didWin ? "You Won!" : "You Lost :("
    }

    func onTapped(tappedNode: ButtonNode) {
        if tappedNode.buttonType == .restartButton {
            gameStateMachine?.enter(GameStartState.self)
        }
    }
}
