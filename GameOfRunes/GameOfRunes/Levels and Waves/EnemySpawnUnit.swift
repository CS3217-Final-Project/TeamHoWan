//
//  EnemySpawnUnit.swift
//  GameOfRunes
//
//  Created by Brian Yen on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

/**
 TODO: Add more information here
 The position of the `EnemyType` within the spawn wave (i.e. the [EnemyType]
 in `unit` will determine the spawn position of the enemy (which lane the
 enemy will be spawned at).
 */
struct EnemySpawnUnit {
    var unit: [[EnemyType]]
    var count: Int {
        unit.count
    }
    var isEmpty: Bool {
        unit.isEmpty
    }

    /** Initialiser to create an empty `EnemySpawnUnit` */
    init() {
        unit = []
        assert(checkRepresentation())
    }

    /**
     Initialiser to create a single spawn wave.
     - Note: At most `GameConfig.GamePlayScene.numLanes`
     monsters can be provided otherwise an error is thrown.
     - Note: Can specify `.none` in order to keep the lane empty,
     subject to the constraints stated above.
     */
    init(_ monsters: EnemyType...) throws {
        guard monsters.count <= GameConfig.GamePlayScene.numLanes else {
            throw LevelWaveError.tooManyEnemyUnits
        }

        // Fill Up with `.none` placeholders
        var emptyPlaceholders: [EnemyType] = []
        let numEmptyPlaceholders = GameConfig.GamePlayScene.numLanes - monsters.count
        if numEmptyPlaceholders != 0 {
            emptyPlaceholders = Array(repeating: .none,
                                      count: numEmptyPlaceholders)
        }

        unit = [monsters + emptyPlaceholders]
        assert(checkRepresentation())
    }

    mutating func removeFirstSpawnWave() -> [EnemyType] {
        assert(checkRepresentation())
        guard !isEmpty else {
            return []
        }
        
        let firstSpawnWave = unit.removeFirst()
        assert(checkRepresentation())
        return firstSpawnWave
    }

    /**
     Concantenate the spawn waves encapsulated within each `EnemySpawnUnit` together.
     */
    static func + (left: EnemySpawnUnit, right: EnemySpawnUnit) -> EnemySpawnUnit {
        var newEnemySpawnUnit = EnemySpawnUnit()
        newEnemySpawnUnit.unit = left.unit + right.unit
        return newEnemySpawnUnit
    }

    /**
     Checks that the ADT's representation invariants are not violated.
     Invariants are:
     - Each spawn wave cannot be completely empty (i.e. only concists of `.none`)
     - Each spawn wave cannot exceed `GameConfig.GamePlayScene.numLanes` monsters
     */
    private func checkRepresentation() -> Bool {
        let noEmptyWavesCheck = unit.filter({ $0.allSatisfy({ $0 == .none }) }).isEmpty
        let doesNotExceedNumLanesCheck = unit.allSatisfy({ $0.count == GameConfig.GamePlayScene.numLanes })

        return noEmptyWavesCheck && doesNotExceedNumLanesCheck
    }

}
