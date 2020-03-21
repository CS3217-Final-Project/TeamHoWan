//
//  BaseTest.swift
//  GameOfRunesTests
//
//  Created by Dong SiJi on 22/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit
@testable import GameOfRunes

class BaseTest {
    var gameStateMachine: GameStateMachine
    var gameScene: GameScene
    var gameEngine: GameEngine
    
    init() {
        gameStateMachine = MockGameStateMachine()
        gameScene = MockGameScene(size: CGSize(), gameStateMachine: gameStateMachine)
        gameEngine = MockGameEngine(gameScene: gameScene)
    }
}
