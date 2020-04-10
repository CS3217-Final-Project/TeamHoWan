//
//  Avatar.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

enum Avatar: Int, CaseIterable {
    case elementalWizard
    case holyKnight
    
    var name: String {
        switch self {
        case .elementalWizard:
            return "Elemental Wizard"
        case .holyKnight:
            return "Holy Knight"
        }
    }
    
    var health: Int {
        switch self {
        case .elementalWizard:
            return 3
        case .holyKnight:
            return 5
        }
    }
    
    var manaUnits: Int {
        switch self {
        case .elementalWizard:
            return 8
        case .holyKnight:
            return 5
        }
    }
    
    var powerUps: [PowerUp] {
        switch self {
        case .elementalWizard:
            return [DarkVortexPowerUp.shared, IcePrisonPowerUp.shared, HellfirePowerUp.shared]
        case .holyKnight:
            return [DivineShieldPowerUp.shared, DivineBlessingPowerUp.shared, HeroicCallPowerUp.shared]
        }
    }
    
    var nextAvatar: Avatar {
        let count = Self.allCases.count
        return Self.allCases[(rawValue + 1) % count]
    }
    
    var prevAvatar: Avatar {
        let count = Self.allCases.count
        return Self.allCases[(rawValue + count - 1) % count]
    }
}
