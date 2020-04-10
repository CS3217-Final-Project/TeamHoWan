//
//  GameInPlayState.swift
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
        return stateClass is GamePauseState.Type && stateClass is GameEndState.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        
        guard let gameStateMachine = stateMachine as? GameStateMachine,
            let sceneManager = gameStateMachine.sceneManager else {
                fatalError("No SceneManager associated with GameStateMachine")
        }
        
        sceneManager.transitionToScene(sceneIdentifier: .play)
    }
}
