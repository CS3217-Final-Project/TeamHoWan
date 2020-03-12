//
//  GameInPlay.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

/** State for `GameStateMachine` when the Game is in play. */
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

        guard let gameEngine = gameStateMachine.gameEngine else {
            fatalError("No GameEngine associated with GameStateMachine")
        }

        if previousState is GamePauseState {
            // Add MoveComponent back to EnemyEntity to allow them to move (If from Pause State to InPlay State)
            gameEngine.entities(for: .enemy).forEach({
                if let enemyEntity = $0 as? EnemyEntity {
                    enemyEntity.addMoveComponent()
                }
            })
        }

        super.didEnter(from: previousState)
        sceneManager.transitionToScene(sceneIdentifier: .play)
    }
}
