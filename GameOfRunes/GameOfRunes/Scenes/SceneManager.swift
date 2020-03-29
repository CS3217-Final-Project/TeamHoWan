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
    }
    
    private let presentingView: SKView
    private let gameStateMachine: GameStateMachine
    private var gamePlayScene: GameScene
    private let gamePauseScene: GamePauseScene
    private let gameEndScene: GameEndScene
    
    init(presentingView: SKView, gameStateMachine: GameStateMachine) {
        // TODO: The following can be removed once the code is in production
        presentingView.showsFPS = true
        presentingView.showsNodeCount = true
        
        presentingView.ignoresSiblingOrder = true
        self.presentingView = presentingView
        
        self.gameStateMachine = gameStateMachine
        
        let sceneSize = self.presentingView.bounds.size
        self.gamePlayScene = GameScene(size: sceneSize,
                                       gameStateMachine: gameStateMachine,
                                       levelNumber: LevelCreator.getRandomLevelNumber())
        self.gamePauseScene = GamePauseScene(size: sceneSize, gameStateMachine: gameStateMachine)
        self.gameEndScene = GameEndScene(size: sceneSize, gameStateMachine: gameStateMachine)
    }
    
    func transitionToScene(sceneIdentifier: SceneIdentifier) {
        let scene: SKScene
        let transition: SKTransition
        
        switch sceneIdentifier {
        case .play:
            scene = self.gamePlayScene
            transition = .doorsOpenHorizontal(withDuration: GameConfig.SceneManager.sceneTransitionDuration)
        case .pause:
            scene = self.gamePauseScene
            transition = .doorsCloseHorizontal(withDuration: GameConfig.SceneManager.sceneTransitionDuration)
        case .end(let didWin):
            self.gameEndScene.didWin = didWin
            scene = self.gameEndScene
            transition = .doorsCloseHorizontal(withDuration: GameConfig.SceneManager.sceneTransitionDuration)
        }
        
        presentingView.presentScene(scene, transition: transition)
    }
    
    /**
     Resets the `GameScene` by creating a new `GameScene` object,
     */
    func restartGame() {
        gamePlayScene = GameScene(size: presentingView.bounds.size,
                                  gameStateMachine: gameStateMachine,
                                  levelNumber: LevelCreator.getRandomLevelNumber())
    }
}
