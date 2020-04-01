//
//  EnemySpawnUnit.swift
//  GameOfRunes
//
//  Created by Brian Yen on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

/**
 This struct is used as the basic unit for creating a level. Different instances
 of it can be concatenated together to create different types of levels. See
 `EnemyWaveCreator` for more examples on how `EnemySpawnUnit` can
  be used to create interesting levels.

 - Note: The position of the `EnemyType` within the spawn wave (i.e. the [EnemyType]
 in `unit` will determine the spawn position of the enemy (which lane the
 enemy will be spawned at).
 - Note: The type is optional (i.e. EnemyType?) because `nil` is used to represent
 an empty lane. 
 */
struct EnemySpawnUnit {
    var unit: [[EnemyType?]]
    // The number of individual spawn waves in `EnemySpawnUnit`
    var count: Int {
        unit.count
    }

    // Checks if the number of individual spawn waves is zero
    var isEmpty: Bool {
        unit.isEmpty
    }
    
    /** Initialiser to create multiple spawn wave.*/
    init(_ monsters: [[EnemyType?]]) {
        // TODO: Might want to check and remove invalid waves?? Or fill up with placeholder values?
        // Alternatively, we can assume that the data given is valid
        unit = monsters
    }

    /** Initialiser to create an empty `EnemySpawnUnit` */
    init() {
        unit = []
        assert(checkRepresentation())
    }

    /**
    Initialiser with variadic parameters
     */
    init(_ monsters: EnemyType?...) throws {
        try self.init(monsters)
    }

    /**
    Initialiser to create a single spawn wave.
    - Note: At most `GameConfig.GamePlayScene.numLanes`
    monsters can be provided otherwise an error is thrown.
    - Note: Can specify `nil` in order to keep the lane empty,
    subject to the constraints stated above.
    */
    init(_ monsters: [EnemyType?]) throws {
        guard monsters.count <= GameConfig.GamePlayScene.numLanes else {
            throw LevelWaveError.tooManyEnemyUnits
        }

        // Fill Up with nil placeholders
        var emptyPlaceholders: [EnemyType?] = []
        let numEmptyPlaceholders = GameConfig.GamePlayScene.numLanes - monsters.count
        if numEmptyPlaceholders != 0 {
            emptyPlaceholders = Array(repeating: nil,
                                      count: numEmptyPlaceholders)
        }

        unit = [monsters + emptyPlaceholders]
        assert(checkRepresentation())
    }

    /**
     Removes the first spawn wave from `unit` and returns it.
     */
    mutating func removeFirstSpawnWave() -> [EnemyType?] {
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

    static func += (left: inout EnemySpawnUnit, right: EnemySpawnUnit) {
        left.unit += right.unit
    }

    /**
     Checks that the ADT's representation invariants are not violated.
     Invariants are:
     - Each spawn wave cannot be completely empty (i.e. only consists of `nil`)
     - Each spawn wave cannot exceed `GameConfig.GamePlayScene.numLanes` monsters
     */
    private func checkRepresentation() -> Bool {
        let noEmptyWavesCheck = !unit.contains(where: { $0.allSatisfy({ $0 == nil }) })
        let doesNotExceedNumLanesCheck = unit.allSatisfy({ $0.count == GameConfig.GamePlayScene.numLanes })

        return noEmptyWavesCheck && doesNotExceedNumLanesCheck
    }

}
