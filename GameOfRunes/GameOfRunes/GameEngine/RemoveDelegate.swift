//
//  RemoveDelegate.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class RemoveDelegate {
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
    }
    
    func removeGesture(for gestureEntity: GestureEntity) {
        guard let enemyEntity = gestureEntity.component(ofType: ParentEntityComponent.self)?
            .parent as? EnemyEntity else {
                return
        }
        
        guard let enemyHealth = gameEngine?.minusHealthPoints(for: enemyEntity) else {
            return
        }
        
        if enemyHealth <= 0 {
            removeUnit(enemyEntity, shouldDecreasePlayerHealth: false, shouldIncreaseScore: true)
            gameEngine?.dropMana(at: enemyEntity)
            return
        }
        
        gameEngine?.remove(gestureEntity)
        if let nextGesture = enemyEntity.setNextGesture() {
            gameEngine?.add(nextGesture)
        }
    }

    func removeUnit(
        _ entity: Entity,
        shouldDecreasePlayerHealth: Bool = false,
        shouldIncreaseScore: Bool = false
    ) {
        if shouldDecreasePlayerHealth {
            gameEngine?.decreasePlayerHealth()
        } else if entity.type == .enemyEntity {
            gameEngine?.incrementCombo()
        }
        
        if shouldIncreaseScore, let scoreComponent = entity.component(ofType: ScoreComponent.self) {
            gameEngine?.addScore(by: scoreComponent.scorePoints)
        }

        removeUnitFromGameWithAnimation(entity)
    }
    
    func removeDroppedMana(_ entity: DroppedManaEntity) {
        guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else {
            return
        }
        
        let removalAnimation = SKAction.sequence([
            .animate(
                with: TextureContainer.manaRemovalTextures,
                timePerFrame: GameConfig.Unit.removalAnimationTimePerFrame,
                resize: true,
                restore: false
            ),
            .removeFromParent()
        ])
        
        // separate removal animation from entity
        let animationNode = SKSpriteNode()
        animationNode.position = spriteComponent.node.position
        animationNode.run(removalAnimation)
        gameEngine?.gameScene?.addNodeToLayer(layer: .removalAnimationLayer, node: animationNode)
        
        gameEngine?.remove(entity)
    }
    
    /**
     Removes the `EnemyEntity` from the game.
     - Note: This method will first remove the `MoveComponent` to prevent
     the enemy from continuing to move. Then it will run the removal animation.
     Upon completion, the `GameEngine`'s `remove` method is called on
     the `EnemyEntity`.
     */
    private func removeUnitFromGameWithAnimation(_ entity: Entity, fullAnimation: Bool = true) {
        guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else {
            return
        }

        let animationTextures = fullAnimation
            ? TextureContainer.fullEnemyRemovalTextures
            : TextureContainer.halfEnemyRemovalTextures
        
        let removalAnimation = SKAction.sequence([
            .animate(
                with: animationTextures,
                timePerFrame: GameConfig.Unit.removalAnimationTimePerFrame,
                resize: true,
                restore: false
            ),
            .removeFromParent()
        ])
        
        // separate removal animation from entity
        let animationNode = SKSpriteNode()
        animationNode.position = spriteComponent.node.position
        // have to save the value instead of a strong reference to the entity
        let entityType = entity.type
                                            // gives some delay till the game terminates
        animationNode.run(removalAnimation, completion: { [weak self] in
            guard entityType == .enemyEntity else {
                return
            }
            self?.gameEngine?.metadata.numEnemiesOnField -= 1
        })
        gameEngine?.gameScene?.addNodeToLayer(layer: .removalAnimationLayer, node: animationNode)
        
        // Changing physicsBody to nil is necessary because SpriteComponent and PhysicsBody do not get
        // deinit immediately, leading to >1 contacts detected.
        spriteComponent.node.physicsBody = nil
        gameEngine?.remove(entity)
    }
}
