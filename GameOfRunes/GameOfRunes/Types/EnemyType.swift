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

    

}
