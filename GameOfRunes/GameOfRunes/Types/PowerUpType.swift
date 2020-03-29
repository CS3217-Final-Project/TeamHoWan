//
//  PowerUpType.swift
//  GameOfRunes
//
//  Created by Jermy on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum PowerUpType: String, CaseIterable {
    case darkVortex
    case hellfire
    case icePrison
    
    var description: String {
        switch self {
        case .darkVortex:
            return GameConfig.DarkVortexPowerUp.description
        case .hellfire:
            return GameConfig.HellFirePowerUp.description
        case .icePrison:
            return GameConfig.IcePrisonPowerUp.description
        }
    }

    var manaUnitCost: Int {
        switch self {
        case .darkVortex:
            return GameConfig.DarkVortexPowerUp.manaUnitCost
        case .hellfire:
            return GameConfig.HellFirePowerUp.manaUnitCost
        case .icePrison:
            return GameConfig.IcePrisonPowerUp.manaUnitCost
        }
    }
}
