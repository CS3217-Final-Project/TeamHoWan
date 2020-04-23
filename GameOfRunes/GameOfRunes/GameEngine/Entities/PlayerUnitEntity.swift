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

    init(gameEngine: GameEngine?) {
        super.init()

        let renderNodeSize = (gameEngine?.rootRenderNode?.size ?? UIScreen.main.bounds.size)
        let unitNode = SKSpriteNode(texture: TextureContainer.eliteKnightTextures.first)
        unitNode.size = unitNode.size.scaleTo(width: renderNodeSize.width * GameConfig.GamePlayScene.unitWidthRatio)
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
        
        // Speed and Acceleration are Proportionate to Screen Size (Treat speed as ratio)
        let timetaken = GameConfig.Unit.standardUnitTraversalTime
        let unitMaxSpeed = Float(renderNodeSize.height) / timetaken
        let unitMaxAcceleration = GameConfig.Unit.accelerationScalingFactor * unitMaxSpeed
 
        let spriteComponent = SpriteComponent(node: unitNode, layerType: .unitLayer)
        let moveComponent = MoveComponent(
            maxSpeed: unitMaxSpeed,
            maxAcceleration: unitMaxAcceleration,
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
