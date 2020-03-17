//
//  GestureAreaNode.swift
//  GameOfRunes
//
//  Created by Andy on 13/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//
import Foundation
import SpriteKit

class GestureAreaNode: SKSpriteNode {
    private var activeSlicePoints = [CGPoint]()
    private var activeSliceBG: SKShapeNode!
    private var activeSliceFG: SKShapeNode!
    private var recogniser: GestureRecognizer
    
    init(size: CGSize, gameEngine: GameEngine) {
        recogniser = GestureRecognizer(gameEngine: gameEngine)
        super.init(texture: .none, color: .clear, size: size)
        
        isUserInteractionEnabled = true
        createSlices()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        activeSlicePoints.removeAll(keepingCapacity: true)
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        activeSlicePoints.append(location)

        // Bezier Curve Construction
        redrawActiveSlice()
        
        activeSliceBG.removeAllActions()
        activeSliceFG.removeAllActions()
        activeSliceBG.alpha = 1.0
        activeSliceFG.alpha = 1.0
        recogniser.touchesBegan(CGPoint(x: location.x + size.width / 2.0, y: location.y + size.height / 2.0))

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        activeSlicePoints.append(location)
        
        // Bezier Curve Construction
        redrawActiveSlice()
        recogniser.touchesMoved(CGPoint(x: location.x + size.width / 2.0, y: size.height / 2.0 - location.y))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>?, with event: UIEvent?) {
        activeSliceBG.run(SKAction.fadeOut(withDuration: 0.25))
        activeSliceFG.run(SKAction.fadeOut(withDuration: 0.25))
        recogniser.touchesEnded()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        guard let touch = touches else {
            return
        }
        touchesEnded(touch, with: event)
    }
    
    fileprivate func redrawActiveSlice() {
        // Not enough slice points - don't draw the slice
        guard activeSlicePoints.count > 2 else {
            self.activeSliceFG.path = nil
            self.activeSliceBG.path = nil
            return
        }

        // Construct path
        let path = UIBezierPath()
        path.move(to: activeSlicePoints[0])
        
        for index in 1..<activeSlicePoints.count {
            path.addLine(to: activeSlicePoints[index])
        }
        
        // Assign path
        activeSliceBG.path = path.cgPath
        activeSliceFG.path = path.cgPath
    }
    
    fileprivate func createSlices() {
        activeSliceBG = SKShapeNode()
        activeSliceBG.zPosition = 1
        activeSliceBG.strokeColor = UIColor(red: 93/255.0, green: 188/255.0, blue: 210/255.0, alpha: 0.9)
        activeSliceBG.lineWidth = 10
        
        activeSliceFG = SKShapeNode()
        activeSliceFG.zPosition = 2
        activeSliceFG.strokeColor = .white
        activeSliceFG.lineWidth = 7
        
        addChild(activeSliceBG)
        addChild(activeSliceFG)
    }
}
