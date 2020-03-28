//
//  PowerUpType.swift
//  GameOfRunes
//
//  Created by Jermy on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum PowerUpType: String, CaseIterable {
    case hellfire
    case icePrison
    case darkVortex
    
    var manaUnitCost: Int {
        switch self {
        case .hellfire:
            return GameConfig.HellFirePowerUp.manaUnitCost
        case .icePrison:
            return GameConfig.IcePrisonPowerUp.manaUnitCost
        case .darkVortex:
            return GameConfig.DarkVortexPowerUp.manaUnitCost
        }
    }
    
    var getFadeOutDuration: TimeInterval {
        switch self {
        case .hellfire:
            return GameConfig.HellFirePowerUp.fadeOutDuration
        case .icePrison:
            return GameConfig.IcePrisonPowerUp.fadeOutDuration
        case .darkVortex:
            return GameConfig.DarkVortexPowerUp.fadeOutDuration
        }
    }
    
    var getPowerUpDuration: TimeInterval {
        switch self {
        case .hellfire:
            return GameConfig.HellFirePowerUp.powerUpDuration
        case .icePrison:
            return GameConfig.IcePrisonPowerUp.powerUpDuration
        case .darkVortex:
            return GameConfig.DarkVortexPowerUp.powerUpDuration
        }
    }
}
