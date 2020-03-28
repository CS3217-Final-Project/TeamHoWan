//
//  LevelCreator.swift
//  GameOfRunes
//
//  Created by Brian Yen on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

struct LevelCreator {
    static func getRandomLevelNumber() -> Int {
        return Int.random(in: 1...3)
    }

    static func getLevelData(levelNumber: Int) throws -> EnemySpawnUnit {
        let (levelData, _) = try getLevelDataAndSpawnInterval(levelNumber: levelNumber)
        return levelData
    }

    static func getLevelSpawnInterval(levelNumber: Int) throws -> Double {
        let (_, levelSpawnInterval) = try getLevelDataAndSpawnInterval(levelNumber: levelNumber)
        return levelSpawnInterval
    }

    private static func getLevelDataAndSpawnInterval(levelNumber: Int) throws -> (EnemySpawnUnit, Double) {
        switch levelNumber {
        case -1:
            return testLevel
        case 1:
            return level1
        case 2:
            return level2
        case 3:
            return level3
        default:
            throw LevelWaveError.invalidLevelNumber
        }
    }

    static var level1: (EnemySpawnUnit, Double) {
        do {
            let basicOrcUnit = try EnemySpawnUnit(.orc1)
            let basicTrollUnit = try EnemySpawnUnit(.troll1)
            let alternatingUnit = basicOrcUnit + basicTrollUnit
            let fullLevel = alternatingUnit + basicOrcUnit
            let levelSpawnInterval = 3.0
            return (fullLevel, levelSpawnInterval)
        } catch {
            fatalError("Unexpected error encountered: \(error)")
        }
    }

    static var level2: (EnemySpawnUnit, Double) {
        do {
            let basicOrcUnit = try EnemySpawnUnit(.orc1, .orc2)
            let basicKnightUnit = try EnemySpawnUnit(.evilKnight, .none, .evilKnight)
            let alternatingUnit = basicOrcUnit + basicKnightUnit
            let fullLevel = alternatingUnit + alternatingUnit
            let levelSpawnInterval = 2.0
            return (fullLevel, levelSpawnInterval)
        } catch {
            fatalError("Unexpected error encountered: \(error)")
        }
    }

    static var level3: (EnemySpawnUnit, Double) {
        do {
            let basicKnightUnit = try EnemySpawnUnit(.evilKnight, .evilKnight, .evilKnight)
            let basicOrcUnit = try EnemySpawnUnit(.orc1, .orc2, .orc1)
            let alternatingUnit = basicKnightUnit + basicOrcUnit
            let fullLevel = alternatingUnit + alternatingUnit + alternatingUnit
            let levelSpawnInterval = 1.0
            return (fullLevel, levelSpawnInterval)
        } catch {
            fatalError("Unexpected error encountered: \(error)")
        }
    }

    static var testLevel: (EnemySpawnUnit, Double) {
        do {
            let fullLevel = try EnemySpawnUnit(.orc1)
            let levelSpawnInterval = 1.0
            return (fullLevel, levelSpawnInterval)
        } catch {
            fatalError("Unexpected error encountered: \(error)")
        }
    }
}
