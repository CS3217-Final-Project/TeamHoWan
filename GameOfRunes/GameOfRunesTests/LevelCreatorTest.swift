//
//  LevelCreatorTest.swift
//  GameOfRunesTests
//
//  Created by Brian Yen on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import XCTest
@testable import GameOfRunes

class LevelCreatorTest: XCTestCase {
    func testCreateLevel_testClosenessToTargetDifficulty() {
        let targetDifficulty = 80
        let threshold = 10
        let level = LevelCreator.createLevel(targetDifficulty: targetDifficulty,
                                             availableMonsters: [.orc1, .orc2])
        let allMonsters = level.unit.flatMap({ $0 })
        let allMonsterDifficulties = LevelCreator.convertMonstersToDifficulties(monsters: allMonsters)
        let totalDifficulty = allMonsterDifficulties.reduce(0, +)
        XCTAssertEqual(Double(totalDifficulty),
                       Double(targetDifficulty),
                       accuracy: Double(threshold))
    }

    // Difficulty (ignoring empty lanes) should be non-decreasing
    func testCreateLevel_testMonoticity() {
        let targetDifficulty = 80
        let level = LevelCreator.createLevel(targetDifficulty: targetDifficulty,
                                             availableMonsters: [.orc1, .orc2])
        let allMonsters = level.unit.flatMap({ $0 })
        let allMonsterDifficulties = LevelCreator.convertMonstersToDifficulties(monsters: allMonsters)
        for (index, difficulty) in allMonsterDifficulties.enumerated() where (index != 0 && difficulty != 0) {
            XCTAssertTrue(difficulty >= allMonsterDifficulties[index - 1])
        }
    }
}
