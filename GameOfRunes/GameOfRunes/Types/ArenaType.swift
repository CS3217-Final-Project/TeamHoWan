//
//  ArenaType.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import RealmSwift

@objc enum ArenaType: Int, CaseIterable, CustomStringConvertible, RealmEnum {
    var description: String {
        "arena\(rawValue)"
    }
    
    case arena1 = 1
    case arena2
    case arena3
    case arena4
    case arena5
    case arena6
    case arena7
    case arena8
    case arena9
    case arena10
    
    var texture: SKTexture {
        .init(imageNamed: "\(self)")
    }
}
