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
    
    init(size: CGSize, gameScene: GameScene) {
        recogniser = GestureRecognizer(gameScene: gameScene)
        super.init(texture: .none, color: .clear, size: size)
        
        isUserInteractionEnabled = true
        createSlices()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        activeSlicePoints.removeAll(keepingCapacity: true)
        guard let touch = touches.first,
            let parent = self.parent else {
            return
        }
        let location = touch.location(in: parent)
        activeSlicePoints.append(touch.location(in: self))

        // Bezier Curve Construction
        redrawActiveSlice()
        
        activeSliceBG.removeAllActions()
        activeSliceFG.removeAllActions()
        activeSliceBG.alpha = 1.0
        activeSliceFG.alpha = 1.0
        // Invert the y-axis from SpriteKit for the recognizer
        recogniser.touchesBegan(CGPoint(x: location.x, y: -location.y + size.height))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first,
            let parent = self.parent else {
            return
        }
        let location = touch.location(in: parent)
        activeSlicePoints.append(touch.location(in: self))

        // Bezier Curve Construction
        redrawActiveSlice()
        // Invert the y-axis from SpriteKit for the recognizer
        recogniser.touchesMoved(CGPoint(x: location.x, y: -location.y + size.height))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>?, with event: UIEvent?) {
        activeSliceBG.run(SKAction.fadeOut(withDuration: 0.25))
        activeSliceFG.run(SKAction.fadeOut(withDuration: 0.25))
        recogniser.touchesEnded(offset: size.height)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        touchesEnded(touches, with: event)
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
        activeSliceBG.strokeColor = UIColor(red: 93 / 255.0, green: 188 / 255.0, blue: 210 / 255.0, alpha: 0.9)
        activeSliceBG.lineWidth = 10
        
        activeSliceFG = SKShapeNode()
        activeSliceFG.zPosition = 2
        activeSliceFG.strokeColor = .white
        activeSliceFG.lineWidth = 7
        
        addChild(activeSliceBG)
        addChild(activeSliceFG)
    }
}
