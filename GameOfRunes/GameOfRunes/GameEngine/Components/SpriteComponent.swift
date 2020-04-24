//
//  SpriteComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class SpriteComponent: GKSKNodeComponent, Component {
    var type: ComponentType {
        .spriteComponent
    }
    var activePauses = 0
    var isTinted: Bool = false {
        didSet {
            guard oldValue != isTinted, let spriteNode = node as? SKSpriteNode else {
                return
            }
            spriteNode.color = .red
            spriteNode.colorBlendFactor = isTinted ? 0.5 : 0.0
        }
    }
    
    // Specifies which `GameScene` layer node to add `node` to
    let layerType: SpriteLayerType

    init(node: SKSpriteNode, layerType: SpriteLayerType) {
        self.layerType = layerType
        super.init()
        
        self.node = node
    }
    
    func setGestureConstraint(referenceNode: SKSpriteNode) {
        let xRange = SKRange(constantValue: 0)
        let yRange = SKRange(constantValue: GameConfig.Enemy.gestureBubbleOffsetPercentage * referenceNode.size.height)

        let constraint = SKConstraint.positionX(xRange, y: yRange)
        constraint.referenceNode = referenceNode

        node.constraints = [constraint]
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
