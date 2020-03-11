//
//  GameEndScene.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class GameEndScene: SKScene, ButtonNodeResponderType, ControlledByGameStateMachine {
    var didWin: Bool = true
    var gameStateMachine: GameStateMachine

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        backgroundColor = SKColor(white: 0, alpha: 1)

        let text = didWin ? "You Won!" : "You Lost :("
        let winLabel = SKLabelNode(text: text)
        winLabel.fontName = "AvenirNext-Bold"
        winLabel.fontSize = 65
        winLabel.fontColor = .white
        winLabel.position = CGPoint(x: frame.midX,
                                    y: frame.midY +
                                        CGFloat(GameplayConfiguration.GameEndScene.buttonHeight/2) +
                                        CGFloat(GameplayConfiguration.GameEndScene.contentSpacing))
        addChild(winLabel)

        let buttonSize = CGSize(width: GameplayConfiguration.GameEndScene.buttonWidth,
                                height: GameplayConfiguration.GameEndScene.buttonHeight)
        let restartButton = ButtonNode(size: buttonSize,
                                       position: CGPoint(x: frame.midX, y: frame.midY),
                                       texture: SKTexture(imageNamed: "restartButton"),
                                       name: "restartButton")
        addChild(restartButton)
    }

    func buttonPressed(button: ButtonNode) {
        if button.name == "restartButton" {
            gameStateMachine.enter(GameStartState.self)
        }
    }
}
