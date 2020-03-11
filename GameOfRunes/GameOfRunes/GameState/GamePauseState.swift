//
//  GamePauseState.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

/** State for `GameStateMachine` when the Game is paused. */
class GamePauseState: GKState {
    /** Checks for if the state to transition to is valid. */
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GameInPlayState.Type
    }

    override func didEnter(from previousState: GKState?) {
        guard let gameStateMachine = stateMachine as? GameStateMachine else {
            return
        }

        guard let sceneManager = gameStateMachine.sceneManager else {
            fatalError("No SceneManager associated with GameStateMachine")
        }

        super.didEnter(from: previousState)
        sceneManager.transitionToScene(sceneIdentifier: .pause)
        // Remove MoveComponent from EnemyEntity to prevent them from moving
        gameStateMachine.entityManager?.entities(for: .enemy).map({
            if let enemyEntity = $0 as? EnemyEntity {
                enemyEntity.removeMoveComponent()
            }
        })
    }
}
