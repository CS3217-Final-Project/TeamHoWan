//
//  CustomGestures.swift
//  GameOfRunes
//
//  Created by Andy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

enum CustomGestures {
    case horizontalLine
    case horizontalLine2
    case verticalLine
    case verticalLine2
    case arrowUp
    case arrowDown
    case eShape
    case wShape
    case doubleWShape
    case uShape
    case zShape
    
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
        }
    }
    
    func getAllGesturePathModels() -> [PathModel] {
        getAllCustomGestures().map({ $0.getPathModel() })
    }
    
    func getAllCustomGestures() -> [CustomGestures] {
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
