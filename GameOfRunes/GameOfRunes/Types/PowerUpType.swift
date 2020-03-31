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
    
    func createEntity(at position: CGPoint, with size: CGSize) -> Entity {
        switch self {
        case .hellfire:
            return HellfirePowerUpEntity(at: position, with: size)
        case .icePrison:
            return IcePrisonPowerUpEntity(at: position, with: size)
        case .darkVortex:
            return DarkVortexPowerUpEntity(at: position, with: size)
        }
    }
}
