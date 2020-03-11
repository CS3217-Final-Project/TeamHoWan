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
        switch sceneIdentifier {
        case .play:
            scene = self.gamePlayScene
        case .pause:
            scene = self.gamePauseScene
        case .end(let didWin):
            self.gameEndScene.didWin = didWin
            scene = self.gameEndScene
        }

        let transition = SKTransition.doorsCloseHorizontal(withDuration: GameplayConfig.SceneManager.sceneTransitionDuration)
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
