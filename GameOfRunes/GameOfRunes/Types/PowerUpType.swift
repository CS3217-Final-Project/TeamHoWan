//
//  PowerUpType.swift
//  GameOfRunes
//
//  Created by Jermy on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum PowerUpType: String, CaseIterable, Codable {
    case darkVortex
    case hellfire
    case icePrison
    case divineBlessing
    case divineShield
    case heroicCall
    
    var powerUp: PowerUp {
        switch self {
        case .darkVortex:
            return DarkVortexPowerUp.shared
        case .hellfire:
            return HellfirePowerUp.shared
        case .icePrison:
            return IcePrisonPowerUp.shared
        case .divineBlessing:
            return DivineBlessingPowerUp.shared
        case .divineShield:
            return DivineShieldPowerUp.shared
        case .heroicCall:
            return HeroicCallPowerUp.shared
        }
    }
    
    static func getPowerUpType(powerUp: PowerUp) -> PowerUpType? {
        switch powerUp {
        case is DarkVortexPowerUp:
            return .darkVortex
        case is HellfirePowerUp:
            return .hellfire
        case is IcePrisonPowerUp:
            return .icePrison
        case is DivineBlessingPowerUp:
            return .divineBlessing
        case is DivineShieldPowerUp:
            return .divineShield
        case is HeroicCallPowerUp:
            return .heroicCall
        default:
            return nil
        }
    }
}
