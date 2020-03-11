//
//  GameStartState.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class GameStartState: GKState {
    /** Checks for if the state to transition to is valid. */
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GameInPlayState.Type
    }

    override func didEnter(from previousState: GKState?) {
        print("Did Enter GameStartState")
        guard let gameStateMachine = stateMachine as? GameStateMachine else {
            print("here")
            return
        }

        guard let sceneManager = gameStateMachine.sceneManager else {
            fatalError("No SceneManager associated with GameStateMachine")
        }

        super.didEnter(from: previousState)
        sceneManager.restartGame()
        gameStateMachine.enter(GameInPlayState.self)
    }
}

