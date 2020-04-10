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
            let gameStateMachine = GameStateMachine(
                states: [GameInPlayState(),
                         GameStartState(),
                         GamePauseState(),
                         GameEndState(),
                         GameSelectionState()]
            )
            view.isMultipleTouchEnabled = false
            sceneManager = .init(presentingView: view, gameStateMachine: gameStateMachine)
            gameStateMachine.sceneManager = sceneManager
            gameStateMachine.enter(GameSelectionState.self)
        }
    }

    override var shouldAutorotate: Bool {
        true
    }

    override var prefersStatusBarHidden: Bool {
        true
    }
}
