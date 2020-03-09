//
//  CustomGestures.swift
//  GameOfRunes
//
//  Created by Andy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

enum CustomGestures: String {
    case horizontalLine
    case horizontalLine2
    case verticalLine
    case verticalLine2
    case arrowUp
    case arrowDown
    case arrowLeft
    case arrowRight
    
    case eShape
    case wShape
    case doubleWShape
    case uShape
    case zShape
    case bShape
    case mShape
    case capitalFShape
    case capitalTShape
    case contortedCShape
    case pShape
    case rShape
    
    case lightning
    case diamond
    case ribbon
    
    
    func getPathModel() -> PathModel {
        switch self {
        case .horizontalLine:
            return PathModel(directions: [0], datas: self as AnyObject)
        case .verticalLine:
            return PathModel(directions: [2], datas: self as AnyObject)
        case .horizontalLine2:
            return PathModel(directions: [4], datas: self as AnyObject)
        case .verticalLine2:
            return PathModel(directions: [6], datas: self as AnyObject)
        case .arrowUp:
            return PathModel(directions: [7, 1], datas: self as AnyObject)
        case .arrowDown:
            return PathModel(directions: [1, 7], datas: self as AnyObject)
        case .eShape:
            return PathModel(directions: [4, 3, 2, 1, 0, 4, 3, 2, 1, 0], datas: self as AnyObject)
        case .wShape:
            return PathModel(directions: [2, 7, 1, 6], datas: self as AnyObject)
        case .doubleWShape:
            return PathModel(directions: [2, 7, 1, 6, 2, 7, 1, 6], datas: self as AnyObject)
        case .uShape:
            return PathModel(directions: [2, 1, 0, 7, 6], datas: self as AnyObject)
        case .zShape:
            return PathModel(directions: [0, 3, 0], datas: self as AnyObject)
        case .capitalTShape:
            return PathModel(directions: [0,2], datas: self as AnyObject)
        case .capitalFShape:
            return PathModel(directions: [4, 3, 2, 1, 0, 4, 3, 2], datas: self as AnyObject)
        case .mShape:
            return PathModel(directions: [6,1,7,2], datas: self as AnyObject)
        case .arrowLeft:
            return PathModel(directions: [3, 1], datas: self as AnyObject)
        case .arrowRight:
            return PathModel(directions: [1, 3], datas: self as AnyObject)
        case .bShape:
            return PathModel(directions: [2,6,0,1,2,3,4,0,1,2,3,4], datas: self as AnyObject)
        case .lightning:
            return PathModel(directions: [2, 7, 2], datas: self as AnyObject)
        case .diamond:
            return PathModel(directions: [1, 3, 5, 7], datas: self as AnyObject)
        case .ribbon:
            return PathModel(directions: [7, 5, 3, 1], datas: self as AnyObject)
        case .contortedCShape:
            return PathModel(directions: [3, 5, 2, 7, 1], datas: self as AnyObject)
        case .pShape:
            return PathModel(directions: [6, 1, 3], datas: self as AnyObject)
        case .rShape:
            return PathModel(directions: [6, 1, 3, 1], datas: self as AnyObject)
        }
    }
    
    static func getAllGesturePathModels() -> [PathModel] {
        getAllCustomGestures().map({ $0.getPathModel() })
    }
    
    static func getAllCustomGestures() -> [CustomGestures] {
        [
            .horizontalLine,
            .horizontalLine2,
            .verticalLine,
            .verticalLine2,
            .arrowUp,
            .arrowDown,
            .eShape,
            .wShape,
            .doubleWShape,
            .uShape,
            .zShape
        ]
    }
}
