//
//  Stage.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit
import RealmSwift

struct Stage {
    @objc enum Category: Int, CustomStringConvertible, RealmEnum {
        case normal
        case boss
        
        var description: String {
            switch self {
            case .normal:
                return "normal"
            case .boss:
                return "boss"
            }
        }
    }
    @objc enum AchievementLevel: Int, CustomStringConvertible, Comparable, RealmEnum {
        case S
        case A
        case B
        case C
        case empty
        
        var description: String {
            switch self {
            case .S:
                return "S"
            case .A:
                return "A"
            case .B:
                return "B"
            case .C:
                return "C"
            case .empty:
                return "empty"
            }
        }
        
        /** Make Achievement Level Comparable */
        static func < (lhs: AchievementLevel, rhs: AchievementLevel) -> Bool {
            lhs.rawValue > rhs.rawValue
        }
    }
    
    let name: String
    let chapter: String
    let category: Category
    let relativePositionRatioInMap: (x: CGFloat, y: CGFloat)
    let arena: ArenaType
    let difficulty: Int
    let numWaves: Int
    // might want to add the array of enemies here? But how do we determine the numWaves?
    var enemyWaves: EnemySpawnUnit
    let enemyWaveSpawnInterval: TimeInterval

    // Note: there is not min score for C because player will obtain it as long as he/she wins the game
    let achievementBMinScore: Int
    let achievementAMinScore: Int
    let achievementSMinScore: Int

    var achievement: AchievementLevel = .empty
    var highScore: Int = 0
    var isEndless: Bool
}
