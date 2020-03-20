//
//  CircleResult.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 20/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

struct CircleResult {
    var center: CGPoint
    var radius: CGFloat
    var error: CGFloat
    var j: Int
    
    init() {
        center = CGPoint(x: 0, y: 0)
        radius = 0
        error = 0
        j = 0
    }
}
