//
//  GamePauseScene.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/** Scene to be displayed when the game is paused. */
class GamePauseScene: SKScene, ButtonNodeResponderType {
    private weak var gameStateMachine: GameStateMachine?

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        super.init(size: size)
        
        self.gameStateMachine = gameStateMachine
        
        let continueButton = ButtonNode(
            size: .init(width: size.width * GameplayConfiguration.GamePauseScene.buttonWidthRatio,
                        height: size.width * GameplayConfiguration.GamePauseScene.buttonHeightRatio),
            position: .init(x: frame.midX, y: frame.midY),
            texture: .init(imageNamed: GameplayConfiguration.GamePauseScene.buttomImageName),
            name: GameplayConfiguration.GamePauseScene.buttomImageName
        )
        addChild(continueButton)
    }
    
    deinit {
        print("deinit game pause scene")
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buttonPressed(button: ButtonNode) {
        if button.name == GameplayConfiguration.GamePauseScene.buttomImageName {
            gameStateMachine?.enter(GameInPlayState.self)
        }
    }
}
