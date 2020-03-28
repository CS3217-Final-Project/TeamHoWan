//
//  Stage.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

struct Stage {
    enum Category: String {
        case normal
        case boss
    }
    enum AchievementLevel: String {
        case S
        case A
        case B
        case C
        case empty
    }
    
    let name: String
    let id: String
    let category: Category
    let relativePositionRatioInMap: (x: CGFloat, y: CGFloat)
    let arena: ArenaType
    let difficulty: Int
    let numWaves: Int
    // might want to add the array of enemies here? But how do we determine the numWaves?
    
    var achievement: AchievementLevel
    var highScore: Int
}
