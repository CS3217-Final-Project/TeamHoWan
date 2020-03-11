//
//  GamePauseScene.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class GamePauseScene: SKScene, ButtonNodeResponderType {
    override func sceneDidLoad() {
        let continueButton = ButtonNode(size: CGSize(width: 100, height: 100), name: "continueButton")
        scene?.addChild(continueButton)
    }

    func buttonPressed(button: ButtonNode) {
        if button.name == "continueButton" {
            print("Continue Button Pressed!")
        }
    }
}
