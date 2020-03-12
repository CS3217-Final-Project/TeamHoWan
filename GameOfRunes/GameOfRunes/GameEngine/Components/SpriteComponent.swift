//
//  SpriteComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class SpriteComponent: GKComponent {
    let node: SKSpriteNode
    let heightToWidthRatio: CGFloat
    
    init(texture: SKTexture) {
        let size = texture.size()
        node = SKSpriteNode(texture: texture, size: size)
        heightToWidthRatio = size.height / size.width
        super.init()
    }
    
    init(gesture: CustomGesture) {
        node = GestureNode(gesture: gesture)
        heightToWidthRatio = node.size.height / node.size.width

        super.init()
    }
    
    func setGestureConstraint(referenceNode: SKSpriteNode) {
        let xRange = SKRange(constantValue: GameplayConfiguration.Enemy.gestureBubbleOffset.x)
        let yRange = SKRange(constantValue: GameplayConfiguration.Enemy.gestureBubbleOffset.y)

        let constraint = SKConstraint.positionX(xRange, y: yRange)
        constraint.referenceNode = referenceNode

        node.constraints = [constraint]
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
