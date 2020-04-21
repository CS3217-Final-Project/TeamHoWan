//
//  GameInMultiplayerPlayState.swift
//  GameOfRunes
//
//  Created by Brian Yen on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

/** State for `GameStateMachine` when the Game is in play (Multiplayer Mode). */
class GameInMultiplayerPlayState: GKState {
    /** Checks for if the state to transition to is valid. */
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        stateClass is GameEndState.Type
    }

    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)

        guard let gameStateMachine = stateMachine as? GameStateMachine,
            let sceneManager = gameStateMachine.sceneManager else {
                fatalError("No SceneManager associated with GameStateMachine")
        }

        sceneManager.transitionToScene(
            sceneIdentifier: .multiplayerPlay,
            transition: .doorsOpenHorizontal(withDuration: GameConfig.SceneManager.sceneTransitionDuration)
        )
    }
}
