//
//  EndPointEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class EndPointEntity: Entity {
    override var type: EntityType {
        .endPointEntity
    }
    
    init(node: SKSpriteNode) {
        super.init()
        
        CollisionType.endpoint.setPhysicsBody(for: node, with: node.size)
        node.addGlow()
        
        let spriteComponent = SpriteComponent(node: node, layerType: .playerAreaLayer)
        
        addComponent(spriteComponent)
    }
}
