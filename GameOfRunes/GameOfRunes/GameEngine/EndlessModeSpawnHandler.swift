//
//  EndlessModeSpawnHandler.swift
//  GameOfRunes
//
//  Created by Brian Yen on 18/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

class EndlessModeSpawnHandler {
    let currentDifficulty: Int
    let gameMetaData: GameMetaData
    init(gameMetaData: GameMetaData) {
        self.gameMetaData = gameMetaData
        self.currentDifficulty = gameMetaData.stage.difficulty
    }

    func addMoreWaves() {
        let additionalEnemyWaves = EnemyWaveCreator.createStageEnemyWave(targetDifficulty: 100, availableMonsters: [.orc1, .orc2, .evilKnight])
        self.gameMetaData.stageWaves += additionalEnemyWaves
        print("\(gameMetaData.stageWaves)")
    }
}
