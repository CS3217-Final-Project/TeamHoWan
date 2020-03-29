//
//  GameMetaData.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

class GameMetaData {
    // TODO: maybe change this to current avatar.
    private (set) var availablePowerUps: [PowerUpType]
    private (set) var maxPlayerHealth: Int
    private (set) var numManaUnits: Int
    private (set) var manaPerManaUnit: Int
    var maxPlayerMana: Int {
        numManaUnits * manaPerManaUnit
    }

    var playerHealth: Int
    var playerMana: Int = 0
    var score: Int = 0
    var selectedPowerUp: PowerUpType?
    var multiplier: Double = 1.0

    init(maxPlayerHealth: Int, numManaUnits: Int, manaPerManaUnit: Int, powerUps: [PowerUpType]) {
        self.maxPlayerHealth = maxPlayerHealth
        self.numManaUnits = numManaUnits
        self.manaPerManaUnit = manaPerManaUnit
        availablePowerUps = powerUps
        playerHealth = maxPlayerHealth
    }
}
