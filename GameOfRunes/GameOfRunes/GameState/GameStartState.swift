//
//  GameStartState.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit
import ReplayKit

/**
 State for `GameStateMachine` when the game is just starting.
 This state automatically transitions to `GameInPlayState` when ready.
 */
class GameStartState: GKState {
    /** Checks for if the state to transition to is valid. */
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        stateClass is GameInPlayState.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        
        guard let gameStateMachine = stateMachine as? GameStateMachine,
            let sceneManager = gameStateMachine.sceneManager else {
                fatalError("No SceneManager associated with GameStateMachine")
        }
        
        sceneManager.loadNewStage()
        RPScreenRecorder.shared().startRecording { err in
            print(err?.localizedDescription ?? "Start recording")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                gameStateMachine.enter(GameInPlayState.self)
            }
        }
    }
}
