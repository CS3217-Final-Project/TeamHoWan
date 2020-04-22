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
        case multiplayerEnd(win: Bool)
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
    private lazy var gameMapScene: GameMapScene = .init(
        size: self.presentingView.bounds.size,
        gameStateMachine: gameStateMachine
    )
    private let gameHomeScene: GameHomeScene
    private let multiplayerGameEndScene: MultiplayerGameEndScene

    init(presentingView: SKView, gameStateMachine: GameStateMachine) {
        presentingView.showsFPS = true
        presentingView.showsNodeCount = true
        
        presentingView.ignoresSiblingOrder = true
        self.presentingView = presentingView
        
        self.gameStateMachine = gameStateMachine
        
        let sceneSize = self.presentingView.bounds.size
        
        gamePauseScene = .init(size: sceneSize, gameStateMachine: gameStateMachine)
        gameEndScene = .init(size: sceneSize, gameStateMachine: gameStateMachine)
        gameHomeScene = .init(size: sceneSize, gameStateMachine: gameStateMachine)
        multiplayerGameEndScene = .init(size: sceneSize, gameStateMachine: gameStateMachine)
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
            gameEndScene.didWin = didWin
            scene = gameEndScene
        case .map:
            gameMapScene.refreshSelectedStage()
            scene = gameMapScene
        case .home:
            scene = gameHomeScene
        case .multiplayerPlay:
            scene = multiplayerGamePlayScene
        case .multiplayerEnd(let didWin):
            multiplayerGameEndScene.didWin = didWin
            scene = multiplayerGameEndScene
        }
        
        presentingView.presentScene(scene, transition: transition)
    }
    
    func loadNewMultiplayerScene() {
        multiplayerGamePlayScene = .init(size: presentingView.bounds.size, gameStateMachine: gameStateMachine)
    }
    
    /**
     Resets the `GameScene` by creating a new `GameScene` object,
     */
    func loadNewStage() {
        gamePlayScene = .init(size: presentingView.bounds.size, gameStateMachine: gameStateMachine)
    }
    
    /**
    Resets the `GameMapScene` by creating a new `GameMapScene` object,
    */
    func loadNewMap() {
        gameMapScene = .init(size: presentingView.bounds.size, gameStateMachine: gameStateMachine)
    }
    
    func resetMultiplayerState() {
        gameHomeScene.resetRoomState()
    }
}
