//
//  GameEngineTest.swift
//  GameOfRunesTests
//
//  Created by Dong SiJi on 22/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import XCTest
import Cuckoo
import GameplayKit
@testable import GameOfRunes

class GameEngineTest: BaseUnitTest {
    override func setUp() {
        super.setUp()
        stub(gameEngine) { stub in
            when(stub.playerEntity.get).thenReturn(playerEntity)
        }
    }
    
    func testEmptyEntities() {
        for entityType in EntityType.allCases {
            XCTAssertTrue(gameEngine.entities(for: entityType).isEmpty)
        }

        XCTAssertTrue(gameEngine.entities(for: .enemy).isEmpty)
        XCTAssertTrue(gameEngine.entities(for: .player).isEmpty)
    }
    
    func testAdd() {
        gameEngine.add(timerEntity)
        verify(gameEngine, times(1)).add(any(Entity.self))
        XCTAssertTrue(gameEngine.entities(for: .timerEntity) == Set([timerEntity]))
        gameEngine.add(timerEntity)
        verify(gameEngine, times(2)).add(any(Entity.self))
        XCTAssertTrue(gameEngine.entities(for: .timerEntity) == Set([timerEntity]))
        gameEngine.add(bossEnemyEntity)
        verify(gameEngine, times(3)).add(any(Entity.self))
        XCTAssertTrue(gameEngine.entities(for: .timerEntity) == Set([timerEntity]))
        XCTAssertTrue(gameEngine.entities(for: .enemyEntity) == Set([bossEnemyEntity]))
        XCTAssertTrue(gameEngine.entities(for: .enemy) == [bossEnemyEntity])
        gameEngine.add(endPointEntity)
        verify(gameEngine, times(4)).add(any(Entity.self))
        XCTAssertTrue(gameEngine.entities(for: .timerEntity) == Set([timerEntity]))
        XCTAssertTrue(gameEngine.entities(for: .enemyEntity) == Set([bossEnemyEntity]))
        XCTAssertTrue(gameEngine.entities(for: .enemy) == [bossEnemyEntity])
        XCTAssertTrue(gameEngine.entities(for: .player) == [endPointEntity])
        gameEngine.add(darkVortexPowerUpEntity)
        verify(gameEngine, times(5)).add(any(Entity.self))
        XCTAssertTrue(gameEngine.entities(for: .timerEntity) == Set([timerEntity]))
        XCTAssertTrue(gameEngine.entities(for: .enemyEntity) == Set([bossEnemyEntity]))
        XCTAssertTrue(gameEngine.entities(for: .enemy) == [bossEnemyEntity])
        XCTAssertTrue(gameEngine.entities(for: .player).count == 2)
        XCTAssertTrue(gameEngine.entities(for: .player).contains(endPointEntity) &&
            gameEngine.entities(for: .player).contains(darkVortexPowerUpEntity))
    }
    
    func testRemove() {
        gameEngine.remove(timerEntity)
        verify(gameEngine, times(1)).remove(any(Entity.self))
        XCTAssertTrue(gameEngine.entities(for: .timerEntity).isEmpty)
        gameEngine.add(timerEntity)
        verify(gameEngine, times(1)).add(any(Entity.self))
        XCTAssertTrue(gameEngine.entities(for: .timerEntity) == Set([timerEntity]))
        gameEngine.remove(timerEntity)
        verify(gameEngine, times(2)).remove(any(Entity.self))
        XCTAssertTrue(gameEngine.entities(for: .timerEntity).isEmpty)
    }
    
    func testRemoveComponent() {
        gameEngine.removeComponent(manaComponent)
        verify(gameEngine, times(1)).removeComponent(any(Component.self))
    }
    
    func testUpdate() {
        gameEngine.update(with: 1)
        verify(gameEngine, times(1)).update(with: any(TimeInterval.self))
    }

    func testSpawnEnemy() {
        gameEngine.startNextSpawnWave()
        verify(gameEngine, times(1)).startNextSpawnWave()
        XCTAssertTrue(gameEngine.entities(for: .enemyEntity).count == 1)
        XCTAssertTrue(gameEngine.entities(for: .gestureEntity).count == 1)
        let gestureEntity = gameEngine.entities(for: .gestureEntity).first as? GestureEntity
        let enemyEntity = gameEngine.entities(for: .enemyEntity).first as? EnemyEntity
        XCTAssertTrue(gestureEntity?.component(ofType: ParentEntityComponent.self)?.parent == enemyEntity)
    }
    
    func testMoveComponents() {
        gameEngine.add(bossEnemyEntity)
        XCTAssertTrue(gameEngine.moveComponents(for: .enemy).count == 1)
        XCTAssertTrue(gameEngine.moveComponents(for: .player).isEmpty)
        gameEngine.add(endPointEntity)
        XCTAssertTrue(gameEngine.moveComponents(for: .enemy).count == 1)
        XCTAssertTrue(gameEngine.moveComponents(for: .player).count == 1)
        gameEngine.add(darkVortexPowerUpEntity)
        XCTAssertTrue(gameEngine.moveComponents(for: .enemy).count == 1)
        XCTAssertTrue(gameEngine.moveComponents(for: .player).count == 2)
    }
    
    func testDecreasePlayerHealth() {
        gameEngine.decreasePlayerHealth()
        verify(gameEngine, times(1)).decreasePlayerHealth()
        verify(gameEngine, times(1)).minusHealthPoints(for: any(GKEntity.self))
        XCTAssertTrue(playerEntity.component(ofType: HealthComponent.self)?.healthPoints == 4)
    }
    
    func testMinusHealthPoints() {
        XCTAssertTrue(gameEngine.minusHealthPoints(for: bossEnemyEntity) == 4)
        verify(gameEngine, times(1)).minusHealthPoints(for: any(GKEntity.self))
    }
    
    func testDropMana() {
        gameEngine.dropMana(at: bossEnemyEntity)
        verify(gameEngine, times(1)).dropMana(at: any(GKEntity.self))
    }

    func testEnemyForceRemoved() {
        gameEngine.startNextSpawnWave()

        verify(gameEngine, times(1)).startNextSpawnWave()
        XCTAssertTrue(gameEngine.entities(for: .enemyEntity).count == 1)
        XCTAssertTrue(gameEngine.entities(for: .gestureEntity).count == 1)
        
        guard let gestureEntity = gameEngine.entities(for: .gestureEntity).first as? GestureEntity,
            let enemyEntity = gameEngine.entities(for: .enemyEntity).first as? EnemyEntity else {
                XCTFail("Fatal error when spawning enemy.")
                return
        }
        
        XCTAssertTrue(gestureEntity.component(ofType: ParentEntityComponent.self)?.parent == enemyEntity)
        
        gameEngine.enemyForceRemoved(enemyEntity)
        verify(gameEngine, times(1)).enemyForceRemoved(any(GKEntity.self))
        verify(gameEngine, times(0)).decreasePlayerHealth()
        verify(gameEngine, times(0)).minusHealthPoints(for: any(GKEntity.self))
        verify(gameEngine, times(2)).remove(any(Entity.self))
        verify(gameEngine, times(0)).dropMana(at: any(GKEntity.self))
        XCTAssertTrue(gameEngine.entities(for: .enemyEntity).isEmpty)
        XCTAssertTrue(gameEngine.entities(for: .gestureEntity).isEmpty)
    }
    
    func testEnemyReachedLine() {
        gameEngine.startNextSpawnWave()

        verify(gameEngine, times(1)).startNextSpawnWave()
        XCTAssertTrue(gameEngine.entities(for: .enemyEntity).count == 1)
        XCTAssertTrue(gameEngine.entities(for: .gestureEntity).count == 1)
        
        guard let gestureEntity = gameEngine.entities(for: .gestureEntity).first as? GestureEntity,
            let enemyEntity = gameEngine.entities(for: .enemyEntity).first as? EnemyEntity else {
                XCTFail("Fatal error when spawning enemy.")
                return
        }
        
        XCTAssertTrue(gestureEntity.component(ofType: ParentEntityComponent.self)?.parent == enemyEntity)
        
        gameEngine.enemyReachedLine(enemyEntity)
        verify(gameEngine, times(1)).enemyReachedLine(any(GKEntity.self))
        verify(gameEngine, times(1)).decreasePlayerHealth()
        verify(gameEngine, times(1)).minusHealthPoints(for: any(GKEntity.self))
        verify(gameEngine, times(2)).remove(any(Entity.self))
        verify(gameEngine, times(0)).dropMana(at: any(GKEntity.self))
        XCTAssertTrue(gameEngine.entities(for: .enemyEntity).isEmpty)
        XCTAssertTrue(gameEngine.entities(for: .gestureEntity).isEmpty)
    }
    
    func testGestureActivated() {
        gameEngine.startNextSpawnWave()

        verify(gameEngine, times(1)).startNextSpawnWave()
        XCTAssertTrue(gameEngine.entities(for: .enemyEntity).count == 1)
        XCTAssertTrue(gameEngine.entities(for: .gestureEntity).count == 1)
        let gestureEntity = gameEngine.entities(for: .gestureEntity).first as? GestureEntity
        let enemyEntity = gameEngine.entities(for: .enemyEntity).first as? EnemyEntity
        XCTAssertTrue(gestureEntity?.component(ofType: ParentEntityComponent.self)?.parent == enemyEntity)

        guard let gesture = gestureEntity?.component(ofType: GestureComponent.self)?.gesture else {
            XCTFail("Fatal Error, gesture entity does not have a gesture.")
            return
        }

        gameEngine.gestureActivated(gesture: gesture)
        verify(gameEngine, times(1)).gestureActivated(gesture: any(CustomGesture.self))
        verify(gameEngine, times(1)).minusHealthPoints(for: any(GKEntity.self))
        verify(gameEngine, times(2)).remove(any(Entity.self))
        verify(gameEngine, times(1)).dropMana(at: any(GKEntity.self))
        XCTAssertTrue(gameEngine.entities(for: .enemyEntity).isEmpty)
        XCTAssertTrue(gameEngine.entities(for: .gestureEntity).isEmpty)
    }
    
    func testStopAnimationForDuration() {
        gameEngine.stopAnimationForDuration(for: bossEnemyEntity,
                                            duration: GameConfig.IcePrisonPowerUp.powerUpDuration,
                                            animationNodeKey: GameConfig.AnimationNodeKey.enemy_walking)
        verify(gameEngine, times(1)).stopAnimationForDuration(for: any(Entity.self),
                                                              duration: any(TimeInterval.self),
                                                              animationNodeKey: anyString())
        XCTAssertTrue(bossEnemyEntity.component(ofType: SpriteComponent.self)?
            .node.action(forKey: GameConfig.AnimationNodeKey.enemy_walking)?.speed == 0)
    }
    
    func testIncreasePlayerMana() {
        gameEngine.increasePlayerMana(by: 10)
        verify(gameEngine, times(1)).increasePlayerMana(by: anyInt())
        XCTAssertTrue(playerEntity.component(ofType: ManaComponent.self)?.manaPoints == 10)
    }
    
    func testDecreasePlayerMana() {
        gameEngine.increasePlayerMana(by: 10)
        verify(gameEngine, times(1)).increasePlayerMana(by: anyInt())
        XCTAssertTrue(playerEntity.component(ofType: ManaComponent.self)?.manaPoints == 10)
        
        gameEngine.decreasePlayerMana(by: 10)
        verify(gameEngine, times(2)).increasePlayerMana(by: anyInt())
        verify(gameEngine, times(1)).decreasePlayerMana(by: anyInt())
        XCTAssertTrue(playerEntity.component(ofType: ManaComponent.self)?.manaPoints == 0)
        
        gameEngine.decreasePlayerMana(by: 10)
        verify(gameEngine, times(3)).increasePlayerMana(by: anyInt())
        verify(gameEngine, times(2)).decreasePlayerMana(by: anyInt())
        XCTAssertTrue(playerEntity.component(ofType: ManaComponent.self)?.manaPoints == 0)
    }
    
    func testDroppedManaTapped() {
        gameEngine.add(droppedManaEntity)
        
        verify(gameEngine, times(1)).add(any(Entity.self))
        XCTAssertTrue(gameEngine.entities(for: .droppedManaEntity) == [droppedManaEntity])

        guard let droppedManaNode = droppedManaEntity
            .component(ofType: SpriteComponent.self)?
            .node as? DroppedManaNode else {
                XCTFail("Fatal error, dropped mana entity has no node.")
                return
        }
        
        gameEngine.droppedManaTapped(droppedManaNode: droppedManaNode)

        verify(gameEngine, times(1)).increasePlayerMana(by: anyInt())
        verify(gameEngine, times(1)).remove(any(Entity.self))
        XCTAssertTrue(gameEngine.entities(for: .droppedManaEntity).isEmpty)
    }
}
