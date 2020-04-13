//
//  EnemyEntityTest.swift
//  GameOfRunesTests
//
//  Created by Dong SiJi on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit
import Cuckoo
import XCTest
@testable import GameOfRunes

class EnemyEntityTest: BaseUnitTest {
    func testCreateEnemy() {
        guard let gestureEntity = bossEnemyEntity.component(ofType: GestureEntityComponent.self)?.gestureEntity,
            let enemyType = bossEnemyEntity.component(ofType: EnemyTypeComponent.self)?.enemyType,
            let gesture = gestureEntity.component(ofType: GestureComponent.self)?.gesture else {
                XCTFail("Enemy Entity does not have a gesture entity and enemy type component.")
                return
        }
        
        XCTAssertTrue(gestureEntity.component(ofType: ParentEntityComponent.self)?.parent == bossEnemyEntity)
        XCTAssertTrue(bossEnemyEntity.component(ofType: HealthComponent.self)?.healthPoints == enemyType.health)
        XCTAssertTrue(enemyType.gesturesAvailable.contains(gesture))
    }
}
