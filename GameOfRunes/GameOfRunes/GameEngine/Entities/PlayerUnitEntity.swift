//
//  PlayerUnitEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 3/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class PlayerUnitEntity: Entity {
    override var type: EntityType {
        .playerUnitEntity
    }

    init(sceneWidth: CGFloat) {
        super.init()
        
        let unitNode = SKSpriteNode(texture: TextureContainer.eliteKnightTextures.first)
        
        unitNode.size = unitNode.size.scaleTo(width: sceneWidth / 6)
        CollisionType.playerUnit.setPhysicsBody(
            for: unitNode,
            with: unitNode.size
        )

        unitNode.run(
            .repeatForever(
                .animate(
                    with: TextureContainer.eliteKnightTextures,
                    timePerFrame: 0.1,
                    resize: false,
                    restore: true
                )
            )
        )
 
        let spriteComponent = SpriteComponent(node: unitNode, layerType: .unitLayer)
        let moveComponent = MoveComponent(
            maxSpeed: 100,
            maxAcceleration: 5.0,
            radius: .init(unitNode.size.height / 2)
        )
        let teamComponent = TeamComponent(team: .player)
        let healthComponent = HealthComponent(healthPoints: 1)

        addComponent(spriteComponent)
        addComponent(teamComponent)
        addComponent(healthComponent)
        addComponent(moveComponent)
    }
}
