//
//  GamePauseScene.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import ReplayKit

/** Scene to be displayed when the game is paused. */
class GamePauseScene: SKScene, TapResponder {
    private weak var gameStateMachine: GameStateMachine?

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        
        anchorPoint = .init(x: 0.5, y: 0.5)
        
        let resumeButton = ButtonNode(
            size: .init(width: size.width * GameConfig.GamePauseScene.buttonWidthRatio,
                        height: size.width * GameConfig.GamePauseScene.buttonHeightRatio),
            texture: .init(imageNamed: "resume-button"),
            buttonType: .resumeButton
        )
        
        addChild(resumeButton)
        
        let homeButton = ButtonNode(
            size: .init(width: size.width * GameConfig.GamePauseScene.buttonWidthRatio,
                        height: size.width * GameConfig.GamePauseScene.buttonHeightRatio),
            texture: .init(imageNamed: "home-button"),
            buttonType: .homeButton
        )
        
        homeButton.position = .init(x: -resumeButton.size.width / 2, y: 0.0)
            + .init(dx: -homeButton.size.width, dy: 0.0)
        addChild(homeButton)
        
        let restartButton = ButtonNode(
            size: .init(width: size.width * GameConfig.GamePauseScene.buttonWidthRatio,
                        height: size.width * GameConfig.GamePauseScene.buttonHeightRatio),
            texture: .init(imageNamed: "restart-button"),
            buttonType: .restartButton
        )
        
        restartButton.position = .init(x: resumeButton.size.width / 2, y: 0.0)
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
            RPScreenRecorder.shared().stopRecording { _, _ in print("End recording") }
            gameStateMachine?.enter(GameStageSelectionState.self)
        case .restartButton:
            RPScreenRecorder.shared().stopRecording { _, _ in print("End recording") }
            gameStateMachine?.enter(GameStartState.self)
        default:
            print("Unknown node tapped:", tappedNode)
        }
    }
}
