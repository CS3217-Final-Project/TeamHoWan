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
        
        let center = CGPoint(x: frame.midX, y: frame.midY)
        
        let resumeButton = ButtonNode(
            size: .init(width: size.width * GameConfig.GamePauseScene.buttonWidthRatio,
                        height: size.width * GameConfig.GamePauseScene.buttonHeightRatio),
            texture: .init(imageNamed: "resume-button"),
            buttonType: .resumeButton,
            position: center
        )
        
        addChild(resumeButton)
        
        let homeButton = ButtonNode(
            size: .init(width: size.width * GameConfig.GamePauseScene.buttonWidthRatio,
                        height: size.width * GameConfig.GamePauseScene.buttonHeightRatio),
            texture: .init(imageNamed: "home-button"),
            buttonType: .homeButton
        )
        
        homeButton.position = center
            + .init(dx: -resumeButton.size.width / 2, dy: 0.0)
            + .init(dx: -homeButton.size.width, dy: 0.0)
        addChild(homeButton)
        
        let restartButton = ButtonNode(
            size: .init(width: size.width * GameConfig.GamePauseScene.buttonWidthRatio,
                        height: size.width * GameConfig.GamePauseScene.buttonHeightRatio),
            texture: .init(imageNamed: "restart-button"),
            buttonType: .restartButton
        )
        
        restartButton.position = center
            + .init(dx: resumeButton.size.width / 2, dy: 0.0)
            + .init(dx: restartButton.size.width, dy: 0.0)
        addChild(restartButton)
    }
    
    deinit {
        print("deinit game pause scene")
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func onTapped(tappedNode: ButtonNode) {
        switch tappedNode.buttonType {
        case .resumeButton:
            gameStateMachine?.enter(GameInPlayState.self)
        case .homeButton:
            gameStateMachine?.enter(GameSelectionState.self)
        case .restartButton:
            gameStateMachine?.enter(GameStartState.self)
        default:
            print("Unknown node tapped")
        }
    }
}
