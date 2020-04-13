//
//  MultiplayerGameViewController.swift
//  GameOfRunes
//
//  Created by Brian Yen on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit
import SpriteKit

class MultiplayerGameViewController: UIViewController {
    private var sceneManager: SceneManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = view as? SKView {
            // TODO: (Brian) Deal with GameStateMachine for Multiplayer
            let gameStateMachine = GameStateMachine(
                states: [GameInMultiplayerPlayState()]
            )
            view.isMultipleTouchEnabled = false
            sceneManager = .init(presentingView: view, gameStateMachine: gameStateMachine)
            gameStateMachine.sceneManager = sceneManager
            gameStateMachine.stage = getMultiplayerStage()
            gameStateMachine.avatar = getMultiplayerAvatar()
            gameStateMachine.enter(GameInMultiplayerPlayState.self)
        }
    }

    // TODO: This is just a temporary function to obtain a Stage object
    // Remove this when there is an established method of determining
    // what stage to use for the Multiplayer game
    private func getMultiplayerStage() -> Stage {
        let stages = HomeViewController.storage.loadAllStages()
        return stages[3]
    }

    // TODO: Replace this in the future (similar to getMultiplayerStage)
    private func getMultiplayerAvatar() -> Avatar {
        Avatar.elementalWizard
    }

    override var shouldAutorotate: Bool {
        true
    }

    override var prefersStatusBarHidden: Bool {
        true
    }
}
