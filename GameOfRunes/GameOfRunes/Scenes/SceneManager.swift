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
        case end
    }

    private let presentingView: SKView

    init(presentingView: SKView) {
        self.presentingView = presentingView
    }

    func transitionToScene(sceneIdentifier: SceneIdentifier) {
        var scene: SKScene
        switch SceneIdentifier {
        case play:
            scene = GameScene(size: self.presentingView.bounds.size)
        case .pause:
            scene = GamePauseScene()
        case .end:
            scene = GameEndScene()
        }

        let transition = SKTransition.doorsCloseHorizontal(withDuration: GameplayConfiguration.SceneManager.progressSceneTransitionDuration)
        presentingView.presentScene(progressScene!, transition: transition)

    }

}
