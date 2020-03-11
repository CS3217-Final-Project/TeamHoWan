//
//  GamePauseScene.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class GamePauseScene: SKScene, ButtonNodeResponderType {
    override func didMove(to view: SKView) {
        let buttonSize = CGSize(width: GameplayConfiguration.GamePauseScene.buttonWidth,
                                height: GameplayConfiguration.GamePauseScene.buttonHeight)
        let continueButton = ButtonNode(size: buttonSize,
                                        position: CGPoint(x: frame.midX, y: frame.midY),
                                        texture: SKTexture(imageNamed: "continueButton"),
                                        name: "continueButton")
        scene?.addChild(continueButton)
    }

    func buttonPressed(button: ButtonNode) {
        if button.name == "continueButton" {
            print("Continue Button Pressed!")
        }
    }
}
