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
}
