//
//  GameMetaData.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation

class GameMetaData {
    // TODO: maybe change this to current avatar.
    let avatar: Avatar
    let stage: Stage
    var availablePowerUps: [PowerUpType] {
        avatar.powerUps
    }
    var maxPlayerHealth: Int {
        avatar.health
    }
    var numManaUnits: Int {
        avatar.manaUnits
    }
    private (set) var manaPointsPerManaUnit: Int
    var maxPlayerMana: Int {
        numManaUnits * manaPointsPerManaUnit
    }

    var playerHealth: Int
    var playerMana: Int = 0
    var score: Int = 0
    var multiplier: Double = 1.0
    var stageWaves: EnemySpawnUnit
    var levelSpawnInterval: TimeInterval
    var numEnemiesOnField: Int = 0
    var selectedPowerUp: PowerUpType?

    init(stage: Stage, avatar: Avatar, manaPointsPerManaUnit: Int) {
        self.manaPointsPerManaUnit = manaPointsPerManaUnit
        self.avatar = avatar
        self.stage = stage
        playerHealth = avatar.health

        levelSpawnInterval = stage.enemyWaveSpawnInterval
        stageWaves = stage.enemyWaves
    }
}
