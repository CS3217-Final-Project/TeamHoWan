//
//  EndlessModeSpawnHandler.swift
//  GameOfRunes
//
//  Created by Brian Yen on 18/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

class EndlessModeSpawnHandler {
    var currentDifficulty: Int
    let gameMetaData: GameMetaData

    let difficultyIncrement = 20
    let maxDifficulty = 100
    let difficultyToMonstersMap: [Int: [EnemyType]] = [
        20: [.orc1, .orc2],
        40: [.orc2, .orc3, .troll1],
        60: [.orc3, .troll1, .troll2],
        80: [.orc3, .troll3, .evilKnight],
        100: [.troll2, .troll3, .evilKnight]
    ]

    init(gameMetaData: GameMetaData) {
        self.gameMetaData = gameMetaData
        self.currentDifficulty = 0
    }

    func addMoreWaves() {
        if currentDifficulty < maxDifficulty {
            currentDifficulty += difficultyIncrement
        }

        guard let availableMonsters = difficultyToMonstersMap[currentDifficulty] else {
            return
        }

        let additionalEnemyWaves = EnemyWaveCreator.createStageEnemyWave(targetDifficulty: currentDifficulty, availableMonsters: availableMonsters)
        self.gameMetaData.stageWaves += additionalEnemyWaves
    }
}
