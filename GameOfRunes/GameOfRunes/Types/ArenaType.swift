//
//  ArenaType.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum ArenaType: String, CaseIterable {
    case arena1
    case arena2
    case arena3
    case arena4
    case arena5
    case arena6
    case arena7
    case finalArena
    
    var texture: SKTexture {
        .init(imageNamed: self.rawValue)
    }
}
