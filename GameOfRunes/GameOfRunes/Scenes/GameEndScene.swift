//
//  GameEndScene.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class GameEndScene: SKScene, ButtonNodeResponderType {
    var didWin: Bool = true

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
        scene?.addChild(restartButton)
    }

    func buttonPressed(button: ButtonNode) {
        if button.name == "restartButton" {
            print("Restart Button Pressed")
        }
    }
}
