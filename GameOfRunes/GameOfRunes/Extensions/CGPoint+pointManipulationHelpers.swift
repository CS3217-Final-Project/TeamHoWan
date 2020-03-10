//
//  CGPoint+pointManipulationHelpers.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        getVector(to: point).magnitude
    }
    
    func getVector(to point: CGPoint) -> CGVector {
        .init(dx: point.x - x, dy: point.y - y)
    }
    
    static func + (lhs: CGPoint, rhs: CGVector) -> CGPoint {
        .init(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
    }
    
    static func + (lhs: CGVector, rhs: CGPoint) -> CGPoint {
        rhs + lhs
    }
    
    static prefix func - (point: CGPoint) -> CGPoint {
        .init(x: -point.x, y: -point.y)
    }
    
    static func += (lhs: inout CGPoint, rhs: CGVector) {
        lhs = rhs + lhs
    }
}
