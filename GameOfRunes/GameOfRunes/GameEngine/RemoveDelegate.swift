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
            let enemyEntity = gestureEntity.parentEntity as? EnemyEntity else {
                return
        }
        
        guard let enemyHealth = gameEngine?.minusHealthPoints(for: enemyEntity) else {
            return
        }
        
        gameEngine?.remove(gestureEntity)
        
        if enemyHealth <= 0 {
            _ = enemyEntity.removeGesture()
            removeEnemy(enemyEntity, shouldDecreasePlayerHealth: false, shouldIncreaseScore: true)
            gameEngine?.dropMana(at: enemyEntity)
            return
        }
        
        enemyEntity.setCurrentGesture()
        
        if let nextGesture = enemyEntity.gestureEntity {
            gameEngine?.add(nextGesture)
        }
    }

    func removeEnemy(_ entity: EnemyEntity, shouldDecreasePlayerHealth: Bool = false,
                     shouldIncreaseScore: Bool = false) {
        removeEnemyFromGame(entity)
        
        if shouldDecreasePlayerHealth {
            gameEngine?.decreasePlayerHealth()
        }
        
        if shouldIncreaseScore {
            guard let scoreComponent = entity.component(ofType: ScoreComponent.self) else {
                return
            }
            gameEngine?.addScore(by: scoreComponent.scorePoints)
        }

        guard let gestureEntity = entity.gestureEntity else {
            return
        }
        _ = entity.removeGesture()
        gameEngine?.remove(gestureEntity)
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
    private func removeEnemyFromGame(_ entity: EnemyEntity, fullAnimation: Bool = true) {
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
        animationNode.run(removalAnimation)
        gameEngine?.gameScene?.addNodeToLayer(layer: .removalAnimationLayer, node: animationNode)
        
        gameEngine?.remove(entity)
    }
}
