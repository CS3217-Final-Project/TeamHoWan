//
//  AttractionEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class AttractionEntity: Entity {
    override var type: EntityType {
        .attractionEntity
    }
    
    init(node: SKSpriteNode, layerType: SpriteLayerType, team: Team, parent: Entity? = nil) {
        super.init()
        let spriteComponent = SpriteComponent(node: node, layerType: layerType)
        let teamComponent = TeamComponent(team: team)
        let moveComponent = MoveComponent(
            maxSpeed: 0.0,
            maxAcceleration: 0.0,
            radius: .zero
        )
        
        addComponent(spriteComponent)
        addComponent(teamComponent)
        addComponent(moveComponent)
        
        guard let parent = parent else {
            return
        }
        
        let parentEntityComponent = ParentEntityComponent(parent)
        addComponent(parentEntityComponent)
    }
}
