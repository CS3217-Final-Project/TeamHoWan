//
//  GKAgent2D+typeConversionHelpers.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

extension GKAgent2D {
    var cgPosition: CGPoint {
        get {
            .init(x: CGFloat(position.x), y: CGFloat(position.y))
        }
        
        set {
            position = .init(x: .init(newValue.x), y: .init(newValue.y))
        }
    }
}
