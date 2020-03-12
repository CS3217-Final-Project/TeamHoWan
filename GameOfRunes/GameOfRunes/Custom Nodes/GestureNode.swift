//
//  GestureNode.swift
//  GameOfRunes
//
//  Created by Andy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class GestureNode: SKSpriteNode {
    let gestureNode = SKSpriteNode()
    // MARK: Initializers
    
    init(gesture: CustomGesture) {
        super.init(texture: nil, color: .clear, size: .zero)
        let texture = gesture.getTexture()
        size = texture.size()
        self.texture = texture
        addChild(gestureNode)
        zPosition = 1
        
        // Constrain the position of the `chargeLevelNode`.
        let xRange = SKRange(constantValue: gestureNode.size.width / -2.0)
        let yRange = SKRange(constantValue: 0.0)
        
        let constraint = SKConstraint.positionX(xRange, y: yRange)
        constraint.referenceNode = self
        
        gestureNode.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        gestureNode.constraints = [constraint]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
