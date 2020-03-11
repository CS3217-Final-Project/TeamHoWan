//
//  SceneManager.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class SceneManager {
    enum SceneIdentifier {
        case play
        case pause
        case end(win: Bool)
    }

    private let presentingView: SKView
    private let gamePlayScene: GameScene
    private let gamePauseScene: GamePauseScene
    private let gameEndScene: GameEndScene

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

        let transition = SKTransition.doorsCloseHorizontal(withDuration: GameplayConfiguration.SceneManager.sceneTransitionDuration)
        presentingView.presentScene(scene, transition: transition)
    }

}
