//
//  PowerUpGesture.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 20/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

enum PowerUpGesture: CaseIterable {
    case circle

    func getPathModel() -> PathModel {
        switch self {
        case .circle:
            return PathModel(directions: [1, 2], datas: self as AnyObject)
        }
    }
    
    static func getAllGesturePathModels() -> [PathModel] {
        allCases.map({ $0.getPathModel() })
    }
}
