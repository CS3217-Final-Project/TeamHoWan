//
//  LevelCreator.swift
//  GameOfRunes
//
//  Created by Brian Yen on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

struct LevelCreator {
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
