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
    var gameStateMachine: MockGameStateMachine!
    var gameScene: GameScene!
    var gameEngine: MockGameEngine!
    var systemDelegate: MockSystemDelegate!
    var removeDelegate: MockRemoveDelegate!
    
    var healthBarNode: HealthBarNode!
    var manaBarNode: ManaBarNode!
    var droppedManaNode: MockDroppedManaNode!
    
    var timerEntity: MockTimerEntity!
    var enemyEntity: EnemyEntity!
    // Note: This is not the gesture entity from enemyEntity.
    var gestureEntity: MockGestureEntity!
    var playerEntity: PlayerEntity!
    var endPointEntity: MockEndPointEntity!
    var darkVortexPowerUpEntity: DarkVortexPowerUpEntity!
    var droppedManaEntity: MockDroppedManaEntity!
    
    var healthComponent: MockHealthComponent!
    var manaComponent: MockManaComponent!

    override func setUp() {
        super.setUp()
        //TODO: Consider removing
        TextureContainer.loadTextures()

        gameStateMachine = MockGameStateMachine(states: [])
            .withEnabledSuperclassSpy()
        // Can't mock gameScene.
        gameScene = GameScene(size: CGSize(),
                              gameStateMachine: gameStateMachine,
                              levelNumber: LevelCreator.getRandomLevelNumber())
        gameEngine = MockGameEngine(gameScene: gameScene, levelNumber: -1)
            .withEnabledSuperclassSpy()
        systemDelegate = MockSystemDelegate(gameEngine: gameEngine)
            .withEnabledSuperclassSpy()
        removeDelegate = MockRemoveDelegate(gameEngine: gameEngine)
            .withEnabledSuperclassSpy()
        
        healthBarNode = HealthBarNode()
        manaBarNode = ManaBarNode()
        droppedManaNode = MockDroppedManaNode(position: CGPoint(), responder: gameEngine)
            .withEnabledSuperclassSpy()
        
        timerEntity = MockTimerEntity(gameEngine: gameEngine, isCountdown: false, initialTimerValue: 0)
            .withEnabledSuperclassSpy()
        enemyEntity = EnemyEntity(enemyType: .evilKnight, gameEngine: gameEngine)
        gestureEntity = MockGestureEntity(gesture: .lightning, parent: enemyEntity)
            .withEnabledSuperclassSpy()
        playerEntity = MockPlayerEntity(gameEngine: gameEngine, healthNode: healthBarNode, manaNode: manaBarNode)
            .withEnabledSuperclassSpy()
        endPointEntity = MockEndPointEntity(gameEngine: gameEngine, node: SKSpriteNode())
            .withEnabledSuperclassSpy()
        darkVortexPowerUpEntity = DarkVortexPowerUpEntity(gameEngine: gameEngine, at: CGPoint(), with: CGSize())
        droppedManaEntity = MockDroppedManaEntity(position: CGPoint(), manaPoints: 10, gameEngine: gameEngine)
            .withEnabledSuperclassSpy()
        
        healthComponent = MockHealthComponent(healthPoints: healthBarNode.livesLeft)
            .withEnabledSuperclassSpy()
        manaComponent = MockManaComponent(manaPoints: manaBarNode.currentManaPoints)
            .withEnabledSuperclassSpy()
    }
    
    override func tearDown() {
        gameStateMachine = nil
        gameScene = nil
        gameEngine = nil
        systemDelegate = nil
        removeDelegate = nil
        
        healthBarNode = nil
        manaBarNode = nil
        droppedManaNode = nil
        
        timerEntity = nil
        enemyEntity = nil
        gestureEntity = nil
        playerEntity = nil
        endPointEntity = nil
        darkVortexPowerUpEntity = nil
        droppedManaEntity = nil
        
        healthComponent = nil
        manaComponent = nil
        super.tearDown()
    }
}
