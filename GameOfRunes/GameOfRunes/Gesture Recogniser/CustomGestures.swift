//
//  CustomGesture.swift
//  GameOfRunes
//
//  Created by Andy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum CustomGesture: String, CaseIterable {
    case verticalLine
    case arrowUp
    case arrowLeft
    case contortedCShape
    case pShape
    case lightning
    case ribbon
    
    func getPathModel() -> PathModel {
        switch self {
        case .verticalLine:
            return PathModel(directions: [2], datas: self as AnyObject)
        case .arrowUp:
            return PathModel(directions: [6, 7, 2, 1], datas: self as AnyObject, filter:{
                (cost:Int, infos:PathInfos) -> Int in
                guard let first = infos.deltaPoints.first?.y,
                    let last = infos.deltaPoints.last?.y else {
                        return cost
                }
                if (last - first > Int16(0.5 * Double(infos.height))) {
                    return cost + 3
                }
                if infos.deltaPoints.count > 3 {
                    let thirdLast = infos.deltaPoints[infos.deltaPoints.count - 3].y
                    if (last <= thirdLast) {
                        return cost + 3
                    }
                }
                return cost
            })
        case .arrowLeft:
            return PathModel(directions: [4, 3, 0, 1], datas: self as AnyObject)
        case .lightning:
            return PathModel(directions: [2, 7, 2], datas: self as AnyObject, filter:{
                (cost:Int, infos:PathInfos) -> Int in
                guard let first = infos.deltaPoints.first?.y,
                    let last = infos.deltaPoints.last?.y else {
                        return cost
                }
                if (last - first < Int16(0.8 * Double(infos.height))) {
                    return cost + 5
                }
                return cost
            })
        case .pShape:
            return PathModel(directions: [6, 1, 3, 3], datas: self as AnyObject, filter:{
                (cost:Int, infos:PathInfos) -> Int in
                guard let last = infos.deltaPoints.last?.y else {
                    return cost
                }
                let upperLimit = infos.boundingBox.top + Int16(0.25 * Double(infos.height))
                let lowerLimit = infos.boundingBox.bottom - Int16(0.35 * Double(infos.height))
                if last < upperLimit || last > lowerLimit {
                    return cost + 5
                }
                return cost
            })
        case .ribbon:
            return PathModel(directions: [7, 5, 3, 1], datas: self as AnyObject)
        case .contortedCShape:
            return PathModel(directions: [3, 5, 2, 7, 1], datas: self as AnyObject)
        }
    }
    
    func getTexture() -> SKTexture {
        SKTexture(imageNamed: "runeGrey_\(self.rawValue)")
    }
    
    static func getAllGesturePathModels() -> [PathModel] {
        allCases.map({ $0.getPathModel() })
    }
}
