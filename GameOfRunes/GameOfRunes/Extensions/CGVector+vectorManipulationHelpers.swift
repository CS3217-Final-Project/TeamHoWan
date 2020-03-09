//
//  CGVector+vectorManipulationHelpers.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

extension CGVector {
    static func + (lhs: CGVector, rhs: CGVector) -> CGVector {
        .init(dx: lhs.dx + rhs.dx, dy: lhs.dy + rhs.dy)
    }
    
    static prefix func - (vector: CGVector) -> CGVector {
        -1.0 * vector
    }
    
    static func - (lhs: CGVector, rhs: CGVector) -> CGVector {
        lhs + -rhs
    }
    
    static func * (lhs: CGVector, rhs: CGVector) -> CGFloat {
        lhs.dx * rhs.dx + lhs.dy * rhs.dy
    }
    
    static func * (lhs: CGFloat, rhs: CGVector) -> CGVector {
        .init(dx: lhs * rhs.dx, dy: lhs * rhs.dy)
    }
    
    static func * (lhs: CGVector, rhs: CGFloat) -> CGVector {
        rhs * lhs
    }
    
    static func / (lhs: CGVector, rhs: CGFloat) -> CGVector {
        guard rhs != 0.0 else {
            return lhs
        }
        
        return lhs * (1 / rhs)
    }
    
    var magnitude: CGFloat {
        sqrt(self * self)
    }
    
    var unitVector: CGVector {
        self / magnitude
    }
}
