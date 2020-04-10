//
//  GestureEntity.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class GestureEntity: Entity {
    override var type: EntityType {
        .gestureEntity
    }

    init(gesture: CustomGesture, parent: Entity) {
        super.init()

        guard let enemySpriteNode = parent.component(ofType: SpriteComponent.self)?.node as? SKSpriteNode else {
            return
        }
        
        let node = GestureNode(gesture: gesture)
        let currentNodeWidth = node.size.width
        let scalingFactor = GameConfig.Enemy.runeScalingFactor * (enemySpriteNode.size.width / currentNodeWidth)
        node.size = CGSize(width: scalingFactor * node.size.width,
                           height: scalingFactor * node.size.height)
        // make it float above the enemy
        node.zPosition = 1
        let spriteComponent = SpriteComponent(node: node, layerType: .unitLayer)
        let gestureComponent = GestureComponent(gesture: gesture)
        let parentEntityComponent = ParentEntityComponent(parent)

        addComponent(spriteComponent)
        addComponent(gestureComponent)
        addComponent(parentEntityComponent)
    }
}
