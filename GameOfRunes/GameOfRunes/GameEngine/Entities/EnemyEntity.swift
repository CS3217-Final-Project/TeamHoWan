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

<<<<<<< HEAD
    init(enemyType: EnemyType, gameEngine: GameEngine) {
        super.init()
        
        let enemyNode = SKSpriteNode(texture: TextureContainer.getEnemyTexture(enemyType))
        let spriteComponent = SpriteComponent(node: enemyNode, layerType: .enemyLayer)
        let sceneSize = gameEngine.gameScene?.size ?? UIScreen.main.bounds.size
        spriteComponent.node.size = spriteComponent.node.size.scaleTo(width: sceneSize.width / 6)

        spriteComponent.node.run(
=======
    init(enemyType: EnemyType, gameEngine: GameEngine, scale: CGFloat) {
        self.enemyType = enemyType

        super.init()

        let node = CollisionNode(texture: TextureContainer.getEnemyTexture(enemyType))
        let spriteComponent = SpriteComponent(node: node)
        
        node.component = spriteComponent
        node.size = node.size.scaleTo(width: scale)
        node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
        node.physicsBody?.affectedByGravity = false
        node.physicsBody?.categoryBitMask = CollisionType.enemy.rawValue
        node.physicsBody?.contactTestBitMask = CollisionType.endpoint.rawValue | CollisionType.powerUp.rawValue
        node.physicsBody?.collisionBitMask = 0
        
        node.run(
>>>>>>> 2a1f7ce768ddaffdbd09b7b83f8eeaab239d7490
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

        let moveComponent = MoveComponent(
            gameEngine: gameEngine,
            maxSpeed: enemyType.speed,
            maxAcceleration: 5.0,
            radius: .init(component(ofType: SpriteComponent.self)?.node.size.width ?? 0) * 0.01
        )
        let teamComponent = TeamComponent(team: .enemy)
        let healthComponent = HealthComponent(healthPoints: enemyType.health)
<<<<<<< HEAD
        let enemyTypeComponent = EnemyTypeComponent(enemyType)
=======
        let scoreComponent = ScoreComponent(scorePoints: GameConfig.Enemy.normalScore)
>>>>>>> 2a1f7ce768ddaffdbd09b7b83f8eeaab239d7490

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
