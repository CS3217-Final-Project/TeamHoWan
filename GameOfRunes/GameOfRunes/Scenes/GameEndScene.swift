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
class GameEndScene: SKScene, ButtonNodeResponderType {
    // initialise with placeholder value
    var didWin = true
    private weak var gameStateMachine: GameStateMachine?
    private let statusLabel = SKLabelNode()

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        
        backgroundColor = .black
        
        let center = CGPoint(x: frame.midX, y: frame.midY)
        let restartButton = ButtonNode(
            size: .init(width: size.width * GameplayConfiguration.GameEndScene.buttonWidthRatio,
                        height: size.width * GameplayConfiguration.GameEndScene.buttonHeightRatio),
            position: center,
            texture: .init(imageNamed: GameplayConfiguration.GameEndScene.buttonImageName),
            name: GameplayConfiguration.GameEndScene.buttonImageName
        )
        addChild(restartButton)
        
        statusLabel.fontName = GameplayConfiguration.fontName
        statusLabel.fontSize = size.width * GameplayConfiguration.GameEndScene.fontSizeRatio
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

    func buttonPressed(button: ButtonNode) {
        if button.name == GameplayConfiguration.GameEndScene.buttonImageName {
            gameStateMachine?.enter(GameStartState.self)
        }
    }
}
