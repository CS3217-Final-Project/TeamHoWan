//
//  GameStateMachine.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

protocol ControlledByGameStateMachine {
    var gameStateMachine: GameStateMachine { get }
}

class GameStateMachine: GKStateMachine {
    weak var sceneManager: SceneManager?

    override init(states: [GKState]) {
        super.init(states: states)
    }
}
