//
//  GamePauseState.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

/** State for `GameStateMachine` when the game is paused. */
class GamePauseState: GKState {
    /** Checks for if the state to transition to is valid. */
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        stateClass is GameInPlayState.Type
            || stateClass is GameStageSelectionState.Type
            || stateClass is GameStartState.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        
        guard let gameStateMachine = stateMachine as? GameStateMachine,
            let sceneManager = gameStateMachine.sceneManager else {
                fatalError("No SceneManager associated with GameStateMachine")
        }
        
        sceneManager.transitionToScene(
            sceneIdentifier: .pause,
            transition: .doorsCloseHorizontal(withDuration: GameConfig.SceneManager.sceneTransitionDuration)
        )
    }
}
