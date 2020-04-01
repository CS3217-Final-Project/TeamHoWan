//
//  EnemyWaveCreator.swift
//  GameOfRunes
//
//  Created by Brian Yen on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation

/**
 Creates and stores Enemy Wave-related data.
 */
struct EnemyWaveCreator {
    /** Obtain the enemy wave data and spawn interval associated with a particular stage. */
    static func getStageEnemyWaveDataAndSpawnInterval(stageNumber: Int) throws -> (EnemySpawnUnit, TimeInterval) {
        switch stageNumber {
        case 1:
            return stage1
        case 2:
            return stage2
        case 3:
            return stage3
        case 4:
            return stage4
        default:
            throw LevelWaveError.invalidStageNumber
        }
    }
    
    static var stage1: (EnemySpawnUnit, TimeInterval) {
        do {
            let basicOrcUnit = try EnemySpawnUnit(nil, .orc1, nil)
            let advancedOrcUnit = try EnemySpawnUnit(.orc2, nil, .orc2)
            let fullStage = basicOrcUnit + basicOrcUnit + advancedOrcUnit
            let stageSpawnInterval = 3.0
            return (fullStage, stageSpawnInterval)
        } catch {
            fatalError("Unexpected error encountered: \(error)")
        }
    }
    
    static var stage2: (EnemySpawnUnit, TimeInterval) {
        do {
            let basicTrollUnit = try EnemySpawnUnit(.troll1, nil, .troll1)
            let advancedTrollUnit = try EnemySpawnUnit(.troll2)
            let fullStage = basicTrollUnit + basicTrollUnit + advancedTrollUnit
            let stageSpawnInterval = 2.0
            return (fullStage, stageSpawnInterval)
        } catch {
            fatalError("Unexpected error encountered: \(error)")
        }
    }
    
    static var stage3: (EnemySpawnUnit, TimeInterval) {
        do {
            let basicKnightUnit = try EnemySpawnUnit(.evilKnight, .evilKnight, .evilKnight)
            let alternateBasicKnightUnit = try EnemySpawnUnit(nil, .evilKnight, nil)
            let alternatingUnit = basicKnightUnit + alternateBasicKnightUnit
            let fullStage = alternatingUnit + alternatingUnit + alternatingUnit
            let stageSpawnInterval = 1.5
            return (fullStage, stageSpawnInterval)
        } catch {
            fatalError("Unexpected error encountered: \(error)")
        }
    }
    
    static var stage4: (EnemySpawnUnit, TimeInterval) {
        do {
            let basicKnightUnit = try EnemySpawnUnit(.evilKnight, .evilKnight, .evilKnight)
            let basicOrcUnit = try EnemySpawnUnit(.orc1, .orc2, .orc1)
            let basicTrollUnit = try EnemySpawnUnit(.troll1, .troll2, .troll3)
            let alternatingUnit = basicKnightUnit + basicOrcUnit + basicTrollUnit
            let fullStage = alternatingUnit + alternatingUnit
            let stageSpawnInterval = 1.0
            return (fullStage, stageSpawnInterval)
        } catch {
            fatalError("Unexpected error encountered: \(error)")
        }
    }
}

/** Extension for automatically creating enemy waves based on desired difficulty */
extension EnemyWaveCreator {
    /**
     Creates an Enemy Wave (Stage) whose total difficulty approaches `targetDifficulty` using the
     monsters found in `availableMonsters`.
     */
    static func createStageEnemyWave(targetDifficulty: Int, availableMonsters: [EnemyType]) -> EnemySpawnUnit {
        let availableMonsterDifficulties = convertMonstersToDifficulties(monsters: availableMonsters)
        let bucket = createProbabilityBuckets(availableMonsterDifficulties: availableMonsterDifficulties)
        let chunkedDifficulties = allocateMonsterDifficulties(
            targetDifficulty: targetDifficulty,
            monsterDifficulties: availableMonsterDifficulties,
            bucket: bucket
        )
        
        var level = EnemySpawnUnit()
        chunkedDifficulties.forEach { spawnWaveDifficulty in
            let spawnWaveMonsters = EnemyWaveCreator.convertDifficultiesToMonsters(
                difficulties: spawnWaveDifficulty
            )
            
            do {
                let enemyUnit = try EnemySpawnUnit(spawnWaveMonsters)
                level += enemyUnit
            } catch {
                fatalError("Unable to create level. Cannot proceed")
            }
        }
        
        return level
    }
    
    /**
     Helper function to convert an array of monsters to an array of their associated difficulties.
     */
    static func convertMonstersToDifficulties(monsters: [EnemyType?]) -> [Int] {
        var monsterDifficulties: [Int] = []
        monsters.forEach { monster in
            monsterDifficulties.append(monster?.difficulty ?? GameConfig.Enemy.nilDifficulty)
        }
        monsterDifficulties.sort()
        return monsterDifficulties
    }
    
    /**
     Helper function to convert an array of monster difficulties to an array of monsters.
     */
    static func convertDifficultiesToMonsters(difficulties: [Int]) -> [EnemyType?] {
        var monsters: [EnemyType?] = []
        difficulties.forEach { difficulty in
            let monster = EnemyType.getMonsterTypeFromDifficulty(difficulty: difficulty)
            monsters.append(monster)
        }
        return monsters
    }
    
    /**
     Creates the probability demarcation for each monster difficulty.
     - Note: The bucket is used to determine which monster difficulty should be selected
     after sampling from a normal distribution. Hence, the demarcation determines the relative
     proportion of each monster difficulty in the resulting sample.
     */
    private static func createProbabilityBuckets(availableMonsterDifficulties: [Int]) -> [Double] {
        let totalNumMonsters = Double(availableMonsterDifficulties.count)
        let denominator: Double = 0.5 * (totalNumMonsters) * (totalNumMonsters + 1)
        
        var numerator: Double = 0
        var bucket: [Double] = []
        
        (1...availableMonsterDifficulties.count).reversed().forEach { i in
            numerator += Double(i)
            bucket.append(numerator / denominator)
        }
        
        return bucket
    }
    
    /**
     Gets the index of the bucket in which `probability` lies.
     */
    private static func getProbabilityBucketIndex(bucket: [Double], probability: Double) -> Int {
        let convenienceBucket = [0] + bucket
        for i in 1..<convenienceBucket.count where probability <= convenienceBucket[i]
            && probability >= convenienceBucket[i - 1] {
                return i - 1
        }
        return -1
    }
    
    /**
     The actual stochastic process that allocates monster difficulties.
     - Note: This process samples from a uniform distribution and then uses the bucket's demarcation
     points to determine which monster difficulty to sample. This is done repeatedly until `targetDifficulty`
     is reached/breached. The monster difficulties are then sorted and chunked in
     `GameConfig.GamePlayScene.numLanes`-sized
     chunks.
     */
    private static func allocateMonsterDifficulties(targetDifficulty: Int,
                                                    monsterDifficulties: [Int],
                                                    bucket: [Double]) -> [[Int]] {
        var allocatedMonsterDifficulties: [Int] = []
        var totalDifficulty = targetDifficulty
        
        // Begin Allocation
        while totalDifficulty > 0 {
            let probValue = Double.random(in: 0...1)
            let index = getProbabilityBucketIndex(bucket: bucket, probability: probValue)
            let monsterDifficulty = monsterDifficulties[index]
            allocatedMonsterDifficulties.append(monsterDifficulty)
            totalDifficulty -= monsterDifficulty
            
            if totalDifficulty < monsterDifficulties[0] {
                totalDifficulty -= monsterDifficulties[0]
            }
        }
        
        // Fill up waves with placeholders to mark empty lanes
        allocatedMonsterDifficulties.sort()
        let numFullWaves = allocatedMonsterDifficulties.count / GameConfig.GamePlayScene.numLanes
        let rem = remainder(
            Double(allocatedMonsterDifficulties.count),
            Double(GameConfig.GamePlayScene.numLanes)
        )
        
        // Gap will always be less than numLanes, so will not have case where
        // inserted zeros are consecutive and form an empty wave
        if rem != 0 {
            let gap = ((numFullWaves + 1) * GameConfig.GamePlayScene.numLanes) -
                allocatedMonsterDifficulties.count
            (1...gap).forEach { _ in
                allocatedMonsterDifficulties.insert(
                    0,
                    at: Int.random(in: 0...allocatedMonsterDifficulties.count - 1)
                )
            }
        }
        
        //Split into individual spawn waves
        let chunkedMonsterDifficulties = stride(
            from: 0, to: allocatedMonsterDifficulties.count,
            by: GameConfig.GamePlayScene.numLanes
        ).map {
            Array(allocatedMonsterDifficulties[
                $0..<min($0 + GameConfig.GamePlayScene.numLanes, allocatedMonsterDifficulties.count)
                ]
            )
        }
        
        return chunkedMonsterDifficulties
    }
}
