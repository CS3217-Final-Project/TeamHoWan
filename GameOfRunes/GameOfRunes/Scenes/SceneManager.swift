//
//  SceneManager.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/**
 Helps manage the scenes to be displayed in View (i.e. `SKView`).
 This class abstracts away the logic required to transition to different
 scenes. This class is meant to be called by `GameStateMachine`
 when `GameStateMachine` transitions between different states.
 */
class SceneManager {
    enum SceneIdentifier {
        case play
        case pause
        case end(win: Bool)
        case map
        case home
        case multiplayerPlay
    }
    
    private let presentingView: SKView
    private let gameStateMachine: GameStateMachine
    private lazy var gamePlayScene: GameScene = .init(
        size: self.presentingView.bounds.size,
        gameStateMachine: gameStateMachine
    )
    private lazy var multiplayerGamePlayScene: MultiplayerGameScene = .init(
        size: self.presentingView.bounds.size,
        gameStateMachine: gameStateMachine
    )
    private let gamePauseScene: GamePauseScene
    private let gameEndScene: GameEndScene
    private let gameMapScene: GameMapScene
    private let gameHomeScene: GameHomeScene

    init(presentingView: SKView, gameStateMachine: GameStateMachine) {
        // TODO: The following can be removed once the code is in production
        presentingView.showsFPS = true
        presentingView.showsNodeCount = true
        
        presentingView.ignoresSiblingOrder = true
        self.presentingView = presentingView
        
        self.gameStateMachine = gameStateMachine
        
        let sceneSize = self.presentingView.bounds.size
        
        self.gamePauseScene = .init(size: sceneSize, gameStateMachine: gameStateMachine)
        self.gameEndScene = .init(size: sceneSize, gameStateMachine: gameStateMachine)
        self.gameMapScene = .init(size: sceneSize, gameStateMachine: gameStateMachine)
        self.gameHomeScene = .init(size: sceneSize, gameStateMachine: gameStateMachine)
    }
    
    func transitionToScene(
        sceneIdentifier: SceneIdentifier,
        transition: SKTransition = .crossFade(withDuration: GameConfig.SceneManager.sceneTransitionDuration)
    ) {
        let scene: SKScene
        
        switch sceneIdentifier {
        case .play:
            scene = gamePlayScene
        case .pause:
            scene = gamePauseScene
        case .end(let didWin):
            self.gameEndScene.didWin = didWin
            scene = gameEndScene
        case .map:
            refreshGameMap()
            scene = gameMapScene
        case .home:
            scene = gameHomeScene
        case .multiplayerPlay:
            scene = multiplayerGamePlayScene
        }
        
        presentingView.presentScene(scene, transition: transition)
    }
    
    /**
     Resets the `GameScene` by creating a new `GameScene` object,
     */
    func beginNewStage() {
        gamePlayScene = .init(
            size: presentingView.bounds.size,
            gameStateMachine: gameStateMachine
        )
    }

    /**
     Refreshes the Game Map (so that back-end updates can be reflected)
     */
    private func refreshGameMap() {
        gameMapScene.refreshGameMap()
    }
}
