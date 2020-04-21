//
//  MultiplayerGameEndState.swift
//  GameOfRunes
//
//  Created by Jermy on 21/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

/** State for `GameStateMachine` when the multiplayer game has ended (either
 win or lose state has been reached) */
class MultiplayerGameEndState: GKState {
    // initialise with placeholder value
    var didWin = true
    var finalScore = 0
    
    /** Checks for if the state to transition to is valid. */
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        stateClass is GameModeSelectionState.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        
        guard let gameStateMachine = stateMachine as? GameStateMachine,
            let sceneManager = gameStateMachine.sceneManager else {
                fatalError("No SceneManager associated with GameStateMachine")
        }

        sceneManager.transitionToScene(
            sceneIdentifier: .end(win: didWin),
            transition: .doorsCloseHorizontal(withDuration: GameConfig.SceneManager.sceneTransitionDuration)
        )
    }
}
