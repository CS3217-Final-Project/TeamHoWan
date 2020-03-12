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
    private var gamePlayScene: GameScene
    private let gamePauseScene: GamePauseScene
    private let gameEndScene: GameEndScene
    private weak var gameStateMachine: GameStateMachine?

    init(presentingView: SKView, gameStateMachine: GameStateMachine) {
        self.presentingView = presentingView
        // TODO: The following can be removed once the code is in production
        self.presentingView.ignoresSiblingOrder = true
        self.presentingView.showsFPS = true
        self.presentingView.showsNodeCount = true

        let sceneSize = self.presentingView.bounds.size
        self.gamePlayScene = GameScene(size: sceneSize, gameStateMachine: gameStateMachine)
        self.gamePauseScene = GamePauseScene(size: sceneSize, gameStateMachine: gameStateMachine)
        self.gameEndScene = GameEndScene(size: sceneSize, gameStateMachine: gameStateMachine)

        self.gameStateMachine = gameStateMachine
    }

    func transitionToScene(sceneIdentifier: SceneIdentifier) {
        var scene: SKScene
        var transition: SKTransition
        switch sceneIdentifier {
        case .play:
            scene = self.gamePlayScene
            transition = .doorsOpenHorizontal(withDuration: GameplayConfiguration.SceneManager.sceneTransitionDuration)
        case .pause:
            scene = self.gamePauseScene
            transition = .doorsCloseHorizontal(withDuration: GameplayConfiguration.SceneManager.sceneTransitionDuration)
        case .end(let didWin):
            self.gameEndScene.didWin = didWin
            scene = self.gameEndScene
            transition = .doorsCloseHorizontal(withDuration: GameplayConfiguration.SceneManager.sceneTransitionDuration)
        }

        
        presentingView.presentScene(scene, transition: transition)
    }

    /**
     Resets the `GameScene` by creating a new `GameScene` object,
     */
    func restartGame() {
        guard let gameStateMachine = gameStateMachine else {
            return
        }

        self.gamePlayScene = GameScene(size: self.presentingView.bounds.size,
                                       gameStateMachine: gameStateMachine)
    }
}
