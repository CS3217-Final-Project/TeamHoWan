//
//  GameStateMachine.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

/**
 Manages the state of the game and the transitions between states.
 - Note: `GameStateMachine` also uses `SceneManager` to help transition
 between scenes when the relevant state transitions are performed.
 */
class GameStateMachine: GKStateMachine {
    weak var sceneManager: SceneManager?
    weak var gameEngine: GameEngine?
    
    override init(states: [GKState]) {
        super.init(states: states)
    }
}
