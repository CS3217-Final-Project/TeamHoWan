//
//  GamePauseScene.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class GamePauseScene: SKScene, ButtonNodeResponderType, ControlledByGameStateMachine {
    var gameStateMachine: GameStateMachine

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        let buttonSize = CGSize(width: GameplayConfiguration.GamePauseScene.buttonWidth,
                                height: GameplayConfiguration.GamePauseScene.buttonHeight)
        let continueButton = ButtonNode(size: buttonSize,
                                        position: CGPoint(x: frame.midX, y: frame.midY),
                                        texture: SKTexture(imageNamed: "continueButton"),
                                        name: "continueButton")
        addChild(continueButton)
    }

    func buttonPressed(button: ButtonNode) {
        if button.name == "continueButton" {
            print("Continue Button Pressed!")
            gameStateMachine.enter(GameInPlayState.self)
        }
    }
}
