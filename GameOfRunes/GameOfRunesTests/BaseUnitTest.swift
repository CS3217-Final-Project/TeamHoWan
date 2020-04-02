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
    var testStage: Stage!
    var testAvatar: Avatar!
    var gameScene: GameScene!
    var gameEngine: MockGameEngine!
    var systemDelegate: MockSystemDelegate!
    var removeDelegate: MockRemoveDelegate!
    
    var scoreNode: ScoreNode!
    var healthBarNode: HealthBarNode!
    var manaBarNode: ManaBarNode!
    var droppedManaNode: MockDroppedManaNode!
    
    var timerEntity: MockTimerEntity!
    var bossEnemyEntity: EnemyEntity!
    // Note: This is not the gesture entity from enemyEntity.
    var gestureEntity: MockGestureEntity!
    var playerEntity: PlayerEntity!
    var endPointEntity: MockEndPointEntity!
    var endPointAttractionEntities: [AttractionEntity]!
    var darkVortexPowerUpEntity: DarkVortexPowerUpEntity!
    var droppedManaEntity: MockDroppedManaEntity!
    
    var healthComponent: MockHealthComponent!
    var manaComponent: MockManaComponent!

    override func setUp() {
        super.setUp()
        TextureContainer.loadTextures()

        gameStateMachine = MockGameStateMachine(states: [])
            .withEnabledSuperclassSpy()
        testStage = Stage(name: "Test Stage",
                          chapter: "Test",
                          category: .normal,
                          relativePositionRatioInMap: (x: 0.17, y: -0.43),
                          arena: .arena1,
                          difficulty: 100,
                          numWaves: 1,
                          enemyWaves: EnemySpawnUnit([[.orc3, nil, nil]]),
                          enemyWaveSpawnInterval: 1.0,
                          achievementBMinScore: 10,
                          achievementAMinScore: 40,
                          achievementSMinScore: 50)
        testAvatar = .elementalWizard
        gameStateMachine.stage = testStage
        gameStateMachine.avatar = testAvatar

        // Can't mock gameScene.
        gameScene = GameScene(size: CGSize(),
                              gameStateMachine: gameStateMachine)
        gameEngine = MockGameEngine(gameScene: gameScene, stage: testStage, avatar: testAvatar)
            .withEnabledSuperclassSpy()
        systemDelegate = MockSystemDelegate(gameEngine: gameEngine)
            .withEnabledSuperclassSpy()
        removeDelegate = MockRemoveDelegate(gameEngine: gameEngine)
            .withEnabledSuperclassSpy()
        
        healthBarNode = HealthBarNode()
        manaBarNode = ManaBarNode()
        scoreNode = ScoreNode()
        droppedManaNode = MockDroppedManaNode(position: CGPoint(), responder: gameEngine)
            .withEnabledSuperclassSpy()
        
        timerEntity = MockTimerEntity(gameEngine: gameEngine, timerNode: SKLabelNode(), initialTimerValue: 0)
            .withEnabledSuperclassSpy()
        bossEnemyEntity = EnemyEntity(enemyType: .evilKnight, gameEngine: gameEngine)
        gestureEntity = MockGestureEntity(gesture: .lightning, parent: bossEnemyEntity)
            .withEnabledSuperclassSpy()
        playerEntity = MockPlayerEntity(
            gameEngine: gameEngine,
            healthNode: healthBarNode,
            manaNode: manaBarNode,
            scoreNode: scoreNode
        )
            .withEnabledSuperclassSpy()
        endPointEntity = MockEndPointEntity(node: SKSpriteNode())
            .withEnabledSuperclassSpy()
        endPointAttractionEntities = endPointEntity
            .component(ofType: AttractionEntitiesComponent.self)?
            .attractionEntities

        darkVortexPowerUpEntity = DarkVortexPowerUpEntity(at: CGPoint(), with: CGSize())
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
        bossEnemyEntity = nil
        gestureEntity = nil
        playerEntity = nil
        endPointEntity = nil
        endPointAttractionEntities = nil
        darkVortexPowerUpEntity = nil
        droppedManaEntity = nil
        
        healthComponent = nil
        manaComponent = nil
        super.tearDown()
    }
}
