//
//  GameInPlay.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class GameInPlayState: GKState {
    /** Checks for if the state to transition to is valid. */
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is GamePauseState.Type, is GameEndState.Type:
            return true
        default:
            return false
        }
    }

    override func didEnter(from previousState: GKState?) {
        guard let gameStateMachine = stateMachine as? GameStateMachine else {
            return
        }

        guard let sceneManager = gameStateMachine.sceneManager else {
            fatalError("No SceneManager associated with GameStateMachine")
        }

        super.didEnter(from: previousState)
        sceneManager.transitionToScene(sceneIdentifier: .play)
    }
}
