//
//  LevelCreator.swift
//  GameOfRunes
//
//  Created by Brian Yen on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

struct LevelCreator {
    static func getLevelData(levelNumber: Int) -> EnemySpawnUnit {
        // TODO: Create new Levels
        // TODO: Add defensive programming code to ensure that un-created levels will throw an error/be made known
        return LevelCreator.defaultLevel
    }
    static var defaultLevel: EnemySpawnUnit {
        do {
            let basicOrcUnit = try EnemySpawnUnit(.orc1, .orc1, .orc1)
            let basicKnightUnit = try EnemySpawnUnit(.evilKnight, .none, .evilKnight)
            let alternatingUnit = basicOrcUnit + basicKnightUnit
            let fullLevel = alternatingUnit + alternatingUnit
            return fullLevel
        } catch {
            fatalError("Unexpected error encountered: \(error)")
        }
    }
}
