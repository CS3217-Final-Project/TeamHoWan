//
//  DBPathRecognizer.swift
//  DBPathRecognizer
//
//  Created by Didier Brun on 15/03/2015.
//  Modified by Andy Lam.
//  Copyright (c) 2015 Didier Brun. All rights reserved.
//

import Foundation
import UIKit

public class GestureRecognizer {
    private var rawPoints:[Int] = []
    private let recognizer = DBPathRecognizer(sliceCount: 8, deltaMove: 16.0, costMax: 10)
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        for pathModel in CustomGesture.getAllGesturePathModels() {
            recognizer.addModel(pathModel)
        }
        self.gameEngine = gameEngine
    }
    
    func touchesBegan(_ location: CGPoint) {
        rawPoints = []
        rawPoints.append(Int(location.x))
        rawPoints.append(Int(location.y))
    }
    
    func touchesMoved(_ location: CGPoint) {
        if rawPoints.isEmpty {
            return
        }
        if (rawPoints[rawPoints.count-2] != Int(location.x) && rawPoints[rawPoints.count-1] != Int(location.y)) {
            rawPoints.append(Int(location.x))
            rawPoints.append(Int(location.y))
        }
    }
    
    func touchesEnded() {
        var path: Path = Path()
        path.addPointFromRaw(rawPoints)
        
        guard let gesture: PathModel = self.recognizer.recognizePath(path),
            let customGesture: CustomGesture = gesture.datas as? CustomGesture else {
            return
        }
        print(customGesture.rawValue)
        gameEngine?.gestureActivated(gesture: customGesture)
    }
}

fileprivate class DBPathRecognizer {
    var deltaMove: Double
    var sliceCount: Int
    var costMax: Int
    var models: [PathModel] = []
    
    fileprivate var path: Path?
    
    init (sliceCount: Int = 8, deltaMove: Double = 8.0, costMax: Int = 32) {
        self.sliceCount = sliceCount
        self.deltaMove = deltaMove
        self.costMax = costMax
    }
    
    fileprivate func recognizePath(_ path: Path) -> PathModel? {
        
        self.path = path
        if path.count < 2 {
            return nil
        }
        
        let dir = directions()
        var bestCost = Int.max
        var bestModel: PathModel?
        
        for model in models {
            var cost = costLeven(model.directions, dir)
            if model.filter != nil {
                cost = model.filter!(cost, PathInfos(deltaPoints: deltaPoints(),
                                                     boundingBox: path.boundingBox, directions: dir))
            }
            if cost < costMax && cost < bestCost {
                bestCost = cost
                bestModel = model
            }
        }
        
        return bestModel
    }
    
    fileprivate func addModel(_ model: PathModel) {
        models.append(model)
    }
    
    fileprivate func deltaPoints() -> [PathPoint] {
        let points = path!.points
        if points.count < 2 {
            return points
        }
        
        var current = points.first!
        var result: [PathPoint] = [current]
        for (_, point) in points.enumerated() {
            
            let distance = current.squareDistanceFromPoint(point)
            
            if distance >= deltaMove * deltaMove {
                current = point
                result.append(current)
            }
        }
        
        if current != points.last! {
            result.append(points.last!)
        }
        return result
    }
    
    fileprivate func directions() -> [Int] {
        let dpoints = deltaPoints()
        if dpoints.count < 2 {
            return []
        }
        
        var result: [Int] = []
        let sliceAngle: Double = .pi * 2.0 / Double(sliceCount)
        
        for (index, _) in dpoints.enumerated() where index < dpoints.count - 1 {
            var angle: Double = dpoints[index].angleWithPoint(dpoints[index + 1])
            
            if angle < 0 {
                angle += .pi * 2.0
            }
            
            if angle < sliceAngle / 2.0 || angle > .pi * 2.0 - sliceAngle {
                result.append(0)
            } else {
                let rounded = Int(round(angle / sliceAngle))
                result.append(rounded)
            }
        }
        
        return result
    }
    
    fileprivate func directionCost(_ a: Int, _ b: Int) -> Int {
        
        var dif = abs(a - b)
        
        if dif > sliceCount / 2 {
            dif = sliceCount - dif
        }
        
        return dif
    }
    
    fileprivate func costLeven(_ a: [Int], _ b: [Int]) -> Int {
        
        var td = Array2D(cols: a.count + 1, rows: b.count + 1)
        var tw = Array2D(cols: a.count + 1, rows: b.count + 1)
        
        let safe_max_value = Int(Int16.max)     
        for x in 1...a.count {
            for y in 1..<b.count {
                td[x, y] = directionCost(a[x - 1], b[y - 1])
            }
        }
        
        for index in 1...b.count {
            tw[0, index] = safe_max_value
        }
        
        for index in 1...a.count {
            tw[index, 0] = safe_max_value
        }
        
        tw[0, 0]=0
        
        var cost: Int = 0
        var pa: Int
        var pb: Int
        var pc: Int
        
        for x in 1...a.count {
            for y in 1..<b.count {
                cost = td[x, y]
                pa = tw[x - 1, y] + cost
                pb = tw[x, y - 1] + cost
                pc = tw[x - 1, y - 1] + cost
                tw[x, y] = min(min(pa, pb), pc)
            }
        }
        
        return tw[a.count, b.count - 1]
    }
    
}

// -----------------------------------------------------------
//
// Helper structs
//
// -----------------------------------------------------------
/* Path point */

public struct PathPoint: Equatable {
    
    var x: Int16 = 0
    var y: Int16 = 0
    
    fileprivate func squareDistanceFromPoint(_ point: PathPoint) -> Double {
        let dfx = Double(point.x) - Double(x)
        let dfy = Double(point.y) - Double(y)
        let sqareDistance = dfx * dfx + dfy * dfy
        return sqareDistance
    }
    
    fileprivate func angleWithPoint(_ point: PathPoint) -> Double {
        let dfx = Double(point.x) - Double(x)
        let dfy = Double(point.y) - Double(y)
        return atan2(dfy, dfx)
    }
}

public func ==(lhs: PathPoint, rhs: PathPoint) -> Bool {
    lhs.x == rhs.x && lhs.y == rhs.y
}

/* Rect */
public struct Rect {
    
    var top: Int16
    var left: Int16
    var bottom: Int16
    var right: Int16
}

/* Path */

fileprivate struct Path {
    var points: [PathPoint] = [PathPoint]()
    
    var boundingBox: Rect {
        get {
            
            var r = Rect(top: Int16.max, left: Int16.max, bottom: Int16.min, right: Int16.min)
            
            for point in points {
                r.left = point.x < r.left ? point.x : r.left
                r.top = point.y < r.top ? point.y : r.top
                r.right = point.x > r.right ? point.x : r.right
                r.bottom = point.y > r.bottom ? point.y : r.bottom
            }
            
            return r
        }
    }
    
    var count: Int {
        get { points.count }
    }
    
    fileprivate mutating func addPoint(_ point: PathPoint) {
        points.append(point)
    }
    
    fileprivate mutating func addPointFromRaw(_ rawDatas: [Int]) {
        let rawDatas = rawDatas
        var i = 0
        var _:PathPoint
        
        while i < rawDatas.count {
            let px = rawDatas[i]
            let py = rawDatas[i + 1]
            let pt = PathPoint(x: Int16(px), y: Int16(py))
            
            addPoint(pt)
            
            i += 2
        }
    }
}

/* Path Infos */

public struct PathInfos {
    let deltaPoints: [PathPoint]
    let boundingBox: Rect
    let directions: [Int]
    
    var width: Int16 {
        get {
            boundingBox.right - boundingBox.left
        }
    }
    
    var height: Int16 {
        get {
            boundingBox.bottom - boundingBox.top
        }
    }
}

/* PathModel */

public struct PathModel {
    
    var directions: [Int]
    var datas: AnyObject
    var filter: ((Int, PathInfos) -> Int)?
    
    init(directions: [Int], datas: AnyObject, filter: ((Int, PathInfos) -> Int)? = nil) {
        self.directions = directions
        self.datas = datas
        self.filter = filter
    }
    
}

/* Array2D */

fileprivate struct Array2D {
    var cols: Int
    var rows: Int
    var matrix: [Int]
    
    init(cols: Int, rows: Int) {
        self.cols = cols
        self.rows = rows
        matrix = Array(repeating: 0, count: cols * rows)
    }
    
    subscript(col: Int, row: Int) -> Int {
        get {
            matrix[cols * row + col]
        }
        set {
            matrix[cols * row + col] = newValue
        }
    }
}
