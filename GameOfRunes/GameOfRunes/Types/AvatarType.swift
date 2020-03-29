//
//  AvatarType.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

enum AvatarType: String, CaseIterable {
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
    
    var powerUps: [PowerUpType] {
        switch self {
        case .elementalWizard:
            return [.darkVortex, .hellfire, .icePrison]
        case .holyKnight:
            // will change when we implement new power ups
            return [.darkVortex, .hellfire, .icePrison]
        }
    }
}
