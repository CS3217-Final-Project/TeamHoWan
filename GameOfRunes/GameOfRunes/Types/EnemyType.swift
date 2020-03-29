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

    var health: Int {
        switch self {
        // normal monsters
        case .orc1, .orc2:
            return 2
        // faster but less hp
        case .orc3:
            return 1
            
        // elite monsters
        case .troll1, .troll2:
            return 3
        // faster but less hp
        case .troll3:
            return 2
        
        // boss
        case .evilKnight:
            return 5
        }
    }
    
    var speed: Float {
        switch self {
        case .orc1, .troll1:
            return GameConfig.Enemy.slowMovementSpeed
        case .orc2, .troll2:
            return GameConfig.Enemy.normalMovementSpeed
        case .orc3, .troll3:
            return GameConfig.Enemy.fastMovementSpeed
        case .evilKnight:
            return GameConfig.Enemy.bossMovementSpeed
        }
    }
    
    var gesturesAvailable: [CustomGesture] {
        switch self {
        case .orc1, .orc2, .orc3:
            return [.verticalLine, .arrowUp, .arrowLeft, .lightning]
        case .troll1, .troll2, .troll3:
            return [.pShape, .mShape, .rShape]
        case .evilKnight:
            // can remove first row for increased difficulty
            return [.verticalLine, .arrowUp, .arrowLeft, .lightning] +
                [.pShape, .mShape, .rShape, .ribbon, .contortedCShape]
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
        }
    }
    
    var isFastMonster: Bool {
        switch self {
        case .orc3, .troll3:
            return true
        default:
            return false
        }
    }
    
    var disablePowerUps: [PowerUpType] {
        switch self {
        default:
            return []
        }
    }
    
    var powerUpImmunity: Bool {
        switch self {
        case .evilKnight:
            return true
        default:
            return false
        }
    }

    /** Provides Difficulty to Monster Mapping */
    static func getMonsterTypeFromDifficulty(difficulty: Int) -> EnemyType? {
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
            return nil
        }
    }
}
