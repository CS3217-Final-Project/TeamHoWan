//
//  EnemyType.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum EnemyType: String, CaseIterable {
    case evilKnight
    case orc1
    case orc2
    case orc3
    case troll1
    case troll2
    case troll3
    case none

    var health: Int {
        switch self {
        default:
            return 1
        }
    }
    
    var gesturesAvailable: [CustomGesture] {
        switch self {
        default:
            return CustomGesture.allCases
        }
    }

    /** Provides Monster to Difficulty Mapping */
    var difficulty: Int {
        switch self {
        case .evilKnight:
            return GameConfig.Enemy.evilKnightDifficulty
        case .orc1:
            return GameConfig.Enemy.orc1Difficulty
        case .orc2:
            return GameConfig.Enemy.orc2Difficulty
        case .orc3:
            return GameConfig.Enemy.orc3Difficulty
        case .troll1:
            return GameConfig.Enemy.troll1Difficulty
        case .troll2:
            return GameConfig.Enemy.troll2Difficulty
        case .troll3:
            return GameConfig.Enemy.troll3Difficulty
        case .none:
            return GameConfig.Enemy.noneDifficulty
        }
    }

    /** Provides Difficulty to Monster Mapping */
    static func getMonsterTypeFromDifficulty(difficulty: Int) -> EnemyType {
        switch difficulty {
        case GameConfig.Enemy.evilKnightDifficulty:
            return .evilKnight
        case GameConfig.Enemy.orc1Difficulty:
            return .orc1
        case GameConfig.Enemy.orc2Difficulty:
            return .orc2
        case GameConfig.Enemy.orc3Difficulty:
            return .orc3
        case GameConfig.Enemy.troll1Difficulty:
            return .troll1
        case GameConfig.Enemy.troll2Difficulty:
            return .troll2
        case GameConfig.Enemy.troll3Difficulty:
            return .troll3
        default:
            return .none
        }
    }
}
