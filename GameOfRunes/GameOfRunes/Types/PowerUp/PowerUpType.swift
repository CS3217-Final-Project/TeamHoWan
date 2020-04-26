//
//  PowerUpType.swift
//  GameOfRunes
//
//  Created by Jermy on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

enum PowerUpType: String, CaseIterable, Codable {
    case darkVortex
    case hellfire
    case icePrison
    case divineBlessing
    case divineShield
    case heroicCall
    
    var powerUp: PowerUp.Type {
        switch self {
        case .darkVortex:
            return DarkVortexPowerUp.self
        case .hellfire:
            return HellfirePowerUp.self
        case .icePrison:
            return IcePrisonPowerUp.self
        case .divineBlessing:
            return DivineBlessingPowerUp.self
        case .divineShield:
            return DivineShieldPowerUp.self
        case .heroicCall:
            return HeroicCallPowerUp.self
        }
    }
}
