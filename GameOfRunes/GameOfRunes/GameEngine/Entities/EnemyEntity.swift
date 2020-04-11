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

    init(enemyType: EnemyType, gameEngine: GameEngine) {
        super.init()

        guard let renderNodeSize = gameEngine.rootRenderNode?.size else {
            print("Unable to obtain rootRenderNode size")
            return
        }

        let enemyNode = SKSpriteNode(texture: TextureContainer.getEnemyTexture(enemyType))
        enemyNode.size = enemyNode.size.scaleTo(width: renderNodeSize.width / 6)
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

        // Monster Speed and Acceleration are Proportionate to Screen Size
        let timeTaken = enemyType.speed
        let enemyMaxSpeed = 10.0 * (Float(renderNodeSize.height) / timeTaken)
        let enemyMaxAcceleration = 5.0 * enemyMaxSpeed

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
        gameEngine.setInitialGesture(for: self)
    }
}
