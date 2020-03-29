//
//  EnemySpawnUnitTest.swift
//  GameOfRunesTests
//
//  Created by Brian Yen on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import XCTest
@testable import GameOfRunes

class EnemySpawnUnitTest: XCTestCase {
    var singleSquad: EnemySpawnUnit?
    var singleSquadWithPlaceholder: EnemySpawnUnit?
    var singleSquadWithNilInInit: EnemySpawnUnit?

    override func setUp() {
        super.setUp()
        singleSquad = try? EnemySpawnUnit(.orc1, .orc2, .orc3)
        singleSquadWithPlaceholder = try? EnemySpawnUnit([.orc1])
        singleSquadWithNilInInit = try? EnemySpawnUnit(.orc1, nil, .orc2)
    }

    override func tearDown() {
        singleSquad = nil
        singleSquadWithPlaceholder = nil
        singleSquadWithNilInInit = nil
        super.tearDown()
    }

    func testInit_tooManyEnemyUnits() {
        let errorMessage = "EnemySpawnUnit cannot have more than GameConfig.GamePlayScene.numLane monsters"
        XCTAssertThrowsError(try EnemySpawnUnit(.orc1, .orc2, .orc3, .orc1, .orc2),
                             errorMessage) { error in
                                XCTAssertEqual(error as? LevelWaveError, LevelWaveError.tooManyEnemyUnits)
        }
    }

    func testInit_success() {
        if let singleSquad = singleSquad {
            XCTAssertEqual(singleSquad.count, 1)
            let unit: [EnemyType?] = [.orc1, .orc2, .orc3]
            XCTAssertEqual(singleSquad.unit, [unit])
        } else {
            XCTFail("Should be able to initialise EnemySpawnUnit")
        }
    }

    func testInitWithPlaceholder_success() {
        if let singleSquadWithPlaceholder = singleSquadWithPlaceholder {
            XCTAssertEqual(singleSquadWithPlaceholder.count, 1)
            let unit: [EnemyType?] = [.orc1, nil, nil]
            XCTAssertEqual(singleSquadWithPlaceholder.unit, [unit])
        } else {
            XCTFail("Should be able to initialise with less than `GameConfig.GamePlayScene.numLanes` monsters")
        }
    }

    func testInitWithNone_success() {
        if let singleSquadWithNilInInit = singleSquadWithNilInInit {
            XCTAssertEqual(singleSquadWithNilInInit.count, 1)
            let unit: [EnemyType?] = [.orc1, nil, .orc2]
            XCTAssertEqual(singleSquadWithNilInInit.unit, [unit])
        } else {
            XCTFail("Should be able to initialise EnemySpawnUnit with nil")
        }
    }

    func testAddition() {
        guard let firstSquad = singleSquad else {
            XCTFail("Failed to create `singleSquad`")
            return
        }

        guard let secondSquad = try? EnemySpawnUnit(.troll1, .troll2) else {
            XCTFail("Failed to create EnemySpawnUnit")
            return
        }

        let combinedUnit = firstSquad + secondSquad
        let firstSquadSpawnWave = firstSquad.unit[0]
        let secondSquadSpawnWave = secondSquad.unit[0]
        XCTAssertEqual(firstSquad.unit, [[.orc1, .orc2, .orc3]])
        XCTAssertEqual(secondSquad.unit, [[.troll1, .troll2, nil]])

        XCTAssertEqual(combinedUnit.count, 2)
        XCTAssertEqual(combinedUnit.unit[0], firstSquadSpawnWave)
        XCTAssertEqual(combinedUnit.unit[1], secondSquadSpawnWave)
        let unit: [[EnemyType?]] = [[.orc1, .orc2, .orc3], [.troll1, .troll2, nil]]
        XCTAssertEqual(combinedUnit.unit, unit)
    }

    func testAdditionAndAssignment() {
        guard var firstSquad = singleSquad else {
            XCTFail("Failed to create `singleSquad`")
            return
        }

        guard let secondSquad = try? EnemySpawnUnit(.troll1, .troll2) else {
            XCTFail("Failed to create EnemySpawnUnit")
            return
        }

        firstSquad += secondSquad
        XCTAssertEqual(firstSquad.unit, [[.orc1, .orc2, .orc3],
                                         [.troll1, .troll2, nil]])
        XCTAssertEqual(secondSquad.unit, [[.troll1, .troll2, nil]])
    }

    func testRemoveFirstSpawnWave_empty() {
        var emptyEnemySpawnUnit = EnemySpawnUnit()
        XCTAssertEqual(emptyEnemySpawnUnit.removeFirstSpawnWave(), [])
    }

    func testRemoveFirstSpawnWave_success() {
        if var singleSquad = singleSquad {
            let firstSpawnWave = singleSquad.removeFirstSpawnWave()
            XCTAssertEqual(firstSpawnWave, [.orc1, .orc2, .orc3])
            XCTAssertEqual(singleSquad.unit, [])
        } else {
            XCTFail("Should be able to initialise EnemySpawnUnit")
        }
    }
}
