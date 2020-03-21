//
//  BaseUnitTest.swift
//  GameOfRunesTests
//
//  Created by Dong SiJi on 22/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import XCTest
import SpriteKit
import GameplayKit
@testable import GameOfRunes

class BaseUnitTest: XCTestCase {
    var gameStateMachine: GameStateMachine!
    var gameScene: GameScene!
    var gameEngine: GameEngine!
    var systemDelegate: SystemDelegate!
    var removeDelegate: RemoveDelegate!
    
    override func setUp() {
        super.setUp()

        gameStateMachine = MockGameStateMachine(states: [])
        // Can't mock gameScene.
        gameScene = GameScene(size: CGSize(), gameStateMachine: gameStateMachine)
        gameEngine = MockGameEngine(gameScene: gameScene)
        systemDelegate = MockSystemDelegate(gameEngine: gameEngine)
        removeDelegate = MockRemoveDelegate(gameEngine: gameEngine)
    }
}
