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
        
        let node = GestureNode(gesture: gesture)
        let spriteComponent = SpriteComponent(node: node, layerType: .enemyLayer)
        let gestureComponent = GestureComponent(gesture: gesture)
        let parentEntityComponent = ParentEntityComponent(parent)

        addComponent(spriteComponent)
        addComponent(gestureComponent)
        addComponent(parentEntityComponent)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
