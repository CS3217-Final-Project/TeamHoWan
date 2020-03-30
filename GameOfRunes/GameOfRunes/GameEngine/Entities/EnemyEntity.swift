//
//  EnemyEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class EnemyEntity: Entity {
    override var type: EntityType {
        .enemyEntity
    }

    init(enemyType: EnemyType, gameEngine: GameEngine) {
        super.init()
        
        let enemyNode = SKSpriteNode(texture: TextureContainer.getEnemyTexture(enemyType))
        
        let sceneSize = gameEngine.gameScene?.size ?? UIScreen.main.bounds.size
        enemyNode.size = enemyNode.size.scaleTo(width: sceneSize.width / 6)
        enemyNode.physicsBody = .init(rectangleOf: enemyNode.size)
        enemyNode.physicsBody?.affectedByGravity = false
        enemyNode.physicsBody?.categoryBitMask = CollisionType.enemy.rawValue
        enemyNode.physicsBody?.contactTestBitMask = CollisionType.endpoint.rawValue | CollisionType.powerUp.rawValue
        enemyNode.physicsBody?.collisionBitMask = 0
        
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
        
        let spriteComponent = SpriteComponent(node: enemyNode, layerType: .enemyLayer)
        let moveComponent = MoveComponent(
            gameEngine: gameEngine,
            maxSpeed: enemyType.speed,
            maxAcceleration: 5.0,
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
        _ = setNextGesture()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setNextGesture() -> GestureEntity? {
        guard let enemyNode = component(ofType: SpriteComponent.self)?.node,
            let enemyType = component(ofType: EnemyTypeComponent.self)?.enemyType else {
            return nil
        }
        
        var availableGestures = enemyType.gesturesAvailable
        
        if let currentGesture = component(ofType: GestureEntityComponent.self)?
            .gestureEntity?
            .component(ofType: GestureComponent.self)?
            .gesture {
                availableGestures.removeAll { $0 == currentGesture }
        }
        
        guard let gesture = availableGestures.randomElement() else {
            return nil
        }

        let gestureEntity = GestureEntity(gesture: gesture, parent: self)
        gestureEntity.component(ofType: SpriteComponent.self)?
            .setGestureConstraint(referenceNode: enemyNode)
        let gestureEntityComponent = GestureEntityComponent(gestureEntity)

        removeComponent(ofType: GestureEntityComponent.self)
        addComponent(gestureEntityComponent)
        
        return gestureEntity
    }
}
