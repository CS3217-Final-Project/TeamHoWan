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
    
    func removeGesture(for entity: GKEntity) {
        guard let gestureEntity = entity as? GestureEntity,
            let enemyEntity = gestureEntity.component(ofType: ParentEntityComponent.self)?.parent else {
                return
        }
        
        guard let enemyHealth = gameEngine?.minusHealthPoints(for: enemyEntity) else {
            return
        }
        
        if enemyHealth <= 0 {
            removeEnemy(enemyEntity, shouldDecreasePlayerHealth: false, shouldIncreaseScore: true)
            gameEngine?.dropMana(at: enemyEntity)
            return
        } else {
            gameEngine?.setNextGesture(for: enemyEntity)
        }
    }

    func removeEnemy(_ entity: Entity, shouldDecreasePlayerHealth: Bool = false,
                     shouldIncreaseScore: Bool = false) {
        if shouldDecreasePlayerHealth, gameEngine?.entities(for: .invincibilityPowerUpEntity).isEmpty ?? true {
            gameEngine?.decreasePlayerHealth()
        } else {
            gameEngine?.incrementCombo()
        }

        if shouldIncreaseScore {
            guard let scoreComponent = entity.component(ofType: ScoreComponent.self) else {
                return
            }
            gameEngine?.addScore(by: scoreComponent.scorePoints)
        }

        removeEnemyFromGameWithAnimation(entity)
    }
    
    func removeDroppedMana(_ entity: DroppedManaEntity) {
        guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else {
            return
        }
        
        let removalAnimation = SKAction.sequence([
            .animate(
                with: TextureContainer.manaRemovalTextures,
                timePerFrame: GameConfig.Enemy.removalAnimationTimePerFrame,
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
    private func removeEnemyFromGameWithAnimation(_ entity: Entity, fullAnimation: Bool = true) {
        guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else {
            return
        }

        let animationTextures = fullAnimation
            ? TextureContainer.fullEnemyRemovalTextures
            : TextureContainer.halfEnemyRemovalTextures
        
        let removalAnimation = SKAction.sequence([
            .animate(
                with: animationTextures,
                timePerFrame: GameConfig.Enemy.removalAnimationTimePerFrame,
                resize: true,
                restore: false
            ),
            .removeFromParent()
        ])
        
        // separate removal animation from entity
        let animationNode = SKSpriteNode()
        animationNode.position = spriteComponent.node.position
                                            // gives some delay till the game terminates
        animationNode.run(removalAnimation, completion: { [weak self] in
            self?.gameEngine?.metadata.numEnemiesOnField -= 1
        })
        gameEngine?.gameScene?.addNodeToLayer(layer: .removalAnimationLayer, node: animationNode)
        
        // Changing physicsBody to nil is necessary because SpriteComponent and PhysicsBody do not get
        // deinit immediately, leading to >1 contacts detected.
        spriteComponent.node.physicsBody = nil
        gameEngine?.remove(entity)
    }
}
