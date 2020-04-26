//
//  EnemyEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class EnemyEntity: Entity {
    override var type: EntityType {
        .enemyEntity
    }

    init(enemyType: EnemyType, gameEngine: GameEngine?) {
        super.init()

        let enemyNode = SKSpriteNode(texture: TextureContainer.getEnemyTexture(enemyType))
        let renderNodeSize = (gameEngine?.renderNode?.size ?? UIScreen.main.bounds.size)
        enemyNode.size = enemyNode.size.scaleTo(width: renderNodeSize.width * GameConfig.GamePlayScene.unitWidthRatio)
        CollisionType.enemyUnit.setPhysicsBody(
            for: enemyNode,
            with: enemyNode.size
        )
        
        enemyNode.run(
            .repeatForever(
                .animate(
                    with: TextureContainer.getEnemyAnimationTextures(enemyType),
                    timePerFrame: 0.1,
                    resize: false,
                    restore: true
                )
            ),
            withKey: GameConfig.AnimationNodeKey.enemy_walking
        )
        
        let spriteComponent = SpriteComponent(node: enemyNode, layerType: .unitLayer)

        // Monster Speed and Acceleration are Proportionate to Screen Size (Treat speed as ratio)
        let timetaken = GameConfig.Unit.standardUnitTraversalTime
        let enemyMaxSpeed = ((enemyType.speed / 100.0) * Float(renderNodeSize.height)) / timetaken
        let enemyMaxAcceleration = GameConfig.Unit.accelerationScalingFactor * enemyMaxSpeed

        let moveComponent = MoveComponent(
            maxSpeed: enemyMaxSpeed,
            maxAcceleration: enemyMaxAcceleration,
            radius: .init(enemyNode.size.height / 2)
        )
        let teamComponent = TeamComponent(team: .enemy)
        let healthComponent = HealthComponent(healthPoints: enemyType.health)
        let enemyTypeComponent = EnemyTypeComponent(enemyType)
        let scoreComponent = ScoreComponent(scorePoints: GameConfig.Enemy.normalScore)

        addComponent(spriteComponent)
        addComponent(scoreComponent)
        addComponent(teamComponent)
        addComponent(healthComponent)
        addComponent(moveComponent)
        addComponent(enemyTypeComponent)
        gameEngine?.setInitialGesture(for: self)
    }
}
