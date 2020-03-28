//
//  LevelCreator.swift
//  GameOfRunes
//
//  Created by Brian Yen on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation
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

/** Extension for automatically creating levels based on desired difficulty */
extension LevelCreator {
    private static var monsterToDifficultyMap: [EnemyType: Int] = [
        .evilKnight: GameConfig.Enemy.evilKnightDifficulty,
        .orc1: GameConfig.Enemy.orc1Difficulty,
        .orc2: GameConfig.Enemy.orc2Difficulty,
        .orc3: GameConfig.Enemy.orc3Difficulty,
        .troll1: GameConfig.Enemy.troll1Difficulty,
        .troll2: GameConfig.Enemy.troll2Difficulty,
        .troll3: GameConfig.Enemy.troll3Difficulty,
        .none: 0
    ]

    private static var difficultyToMonsterMap: [Int: EnemyType] = [
        0: .none,
        GameConfig.Enemy.evilKnightDifficulty: .evilKnight,
        GameConfig.Enemy.orc1Difficulty: .orc1,
        GameConfig.Enemy.orc2Difficulty: .orc2,
        GameConfig.Enemy.orc3Difficulty: .orc3,
        GameConfig.Enemy.troll1Difficulty: .troll1,
        GameConfig.Enemy.troll2Difficulty: .troll2,
        GameConfig.Enemy.troll3Difficulty: .troll3
    ]

    static func createLevel(targetDifficulty: Int, availableMonsters: [EnemyType]) -> EnemySpawnUnit {
        let availableMonsterDifficulties = convertMonsterToDifficulties(monsters: availableMonsters)
        let bucket = createProbabilityBuckets(availableMonsterDifficulties: availableMonsterDifficulties)
        let chunkedMonsterDifficulties = allocateMonsterDifficulties(targetDifficulty: targetDifficulty,
                                                                     availableMonsterDifficulties: availableMonsterDifficulties,
                                                                     bucket: bucket)

        var level = EnemySpawnUnit()
        for spawnWaveDifficulty in chunkedMonsterDifficulties {
            let spawnWaveMonsters = LevelCreator.convertDifficultiesToMonsters(difficulties: spawnWaveDifficulty)
            do {
                let enemyUnit = try EnemySpawnUnit(spawnWaveMonsters)
                level += enemyUnit
            } catch {
                fatalError("Unable to create level. Cannot proceed")
            }
        }

        return level
    }

    static func convertMonsterToDifficulties(monsters: [EnemyType]) -> [Int] {
        var monsterDifficulties: [Int] = []
        for monster in monsters {
            assert(monsterToDifficultyMap[monster] != nil)
            if let monsterDifficulty = monsterToDifficultyMap[monster] {
                monsterDifficulties.append(monsterDifficulty)
            }
        }
        monsterDifficulties.sort()
        return monsterDifficulties
    }

    static func convertDifficultiesToMonsters(difficulties: [Int]) -> [EnemyType] {
        var monsters: [EnemyType] = []
        for difficulty in difficulties {
            assert(difficultyToMonsterMap[difficulty] != nil)
            if let monster = difficultyToMonsterMap[difficulty] {
                monsters.append(monster)
            }
        }
        return monsters
    }

    private static func createProbabilityBuckets(availableMonsterDifficulties: [Int]) -> [Double] {
        let totalNumMonsters = Double(availableMonsterDifficulties.count)
        let denominator: Double = 0.5 * (totalNumMonsters) * (totalNumMonsters + 1)

        var numerator: Double = 0
        var bucket: [Double] = []

        for i in (1...availableMonsterDifficulties.count).reversed() {
            numerator += Double(i)
            bucket.append(numerator / denominator)
        }

        return bucket
    }

    private static func getProbabilityBucketIndex(bucket: [Double], probability: Double) -> Int {
        let convenienceBucket = [0] + bucket
        for i in (1...(convenienceBucket.count - 1)) {
            if probability <= convenienceBucket[i] && probability >= convenienceBucket[i-1] {
                return i - 1
            }
        }
        return -1
    }

    private static func allocateMonsterDifficulties(targetDifficulty: Int,
                                                    availableMonsterDifficulties: [Int],
                                                    bucket: [Double]) -> [[Int]] {
        var allocatedMonsterDifficulties: [Int] = []
        var totalDifficulty = targetDifficulty

        // Begin Allocation
        while totalDifficulty > 0 {
            let probValue = Double.random(in: 0...1)
            let index = getProbabilityBucketIndex(bucket: bucket, probability: probValue)
            let monsterDifficulty = availableMonsterDifficulties[index]
            allocatedMonsterDifficulties.append(monsterDifficulty)
            totalDifficulty -= monsterDifficulty

            if totalDifficulty < availableMonsterDifficulties[0] {
                totalDifficulty -= availableMonsterDifficulties[0]
            }
        }

        // Fill up waves with placeholders to mark empty lanes
        allocatedMonsterDifficulties.sort()
        let numFullWaves = allocatedMonsterDifficulties.count / GameConfig.GamePlayScene.numLanes
        let rem = remainder(Double(allocatedMonsterDifficulties.count),
                            Double(GameConfig.GamePlayScene.numLanes))

        // Gap will always be less than numLanes, so will not have case where
        // inserted zeros are consecutive and form an empty wave
        if rem != 0 {
            let gap = ((numFullWaves + 1) * GameConfig.GamePlayScene.numLanes) -
                       allocatedMonsterDifficulties.count
            for _ in 1...gap {
                allocatedMonsterDifficulties.insert(0, at: Int.random(in: 0...allocatedMonsterDifficulties.count-1))
            }
        }

        //Split into individual spawn waves
        let chunkedMonsterDifficulties = stride(from: 0, to: allocatedMonsterDifficulties.count, by: GameConfig.GamePlayScene.numLanes).map {
            Array(allocatedMonsterDifficulties[$0..<min($0 + GameConfig.GamePlayScene.numLanes, allocatedMonsterDifficulties.count)])
        }

        return chunkedMonsterDifficulties
    }
}
