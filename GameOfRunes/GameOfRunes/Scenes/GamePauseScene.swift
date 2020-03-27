//
//  GamePauseScene.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/** Scene to be displayed when the game is paused. */
class GamePauseScene: SKScene, TapResponder {
    private weak var gameStateMachine: GameStateMachine?

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        
        let continueButton = ButtonNode(
            size: .init(width: size.width * GameConfig.GamePauseScene.buttonWidthRatio,
                        height: size.width * GameConfig.GamePauseScene.buttonHeightRatio),
            position: .init(x: frame.midX, y: frame.midY),
            texture: .init(imageNamed: ButtonType.continueButton.rawValue),
            name: ButtonType.continueButton.rawValue
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

    func onTapped(tappedNode: SKSpriteNode) {
        if tappedNode.name == ButtonType.continueButton.rawValue {
            gameStateMachine?.enter(GameInPlayState.self)
        }
    }
}
