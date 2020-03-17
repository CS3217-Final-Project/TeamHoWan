//
//  SpriteComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class SpriteComponent: GKComponent, Component {
    let node: SKSpriteNode
    
    init(texture: SKTexture?) {
        node = SKSpriteNode(texture: texture, size: texture?.size() ?? .zero)
        super.init()
    }
    
    init(gesture: CustomGesture) {
        node = GestureNode(gesture: gesture)

        super.init()
    }

    init(droppedManaNode: DroppedManaNode) {
        node = droppedManaNode
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
    
    func getType() -> ComponentType {
        return .spriteComponent
    }
}
