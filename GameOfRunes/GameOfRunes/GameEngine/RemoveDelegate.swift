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
    
    func removeGesture(for entity: Entity) {
        guard entity.type == .gestureEntity,
            let enemyEntity = entity.component(ofType: ParentEntityComponent.self)?.parent,
            enemyEntity.type == .enemyEntity,
            let enemyHealth = gameEngine?.minusHealthPoints(for: enemyEntity) else {
                return
        }
        
        if enemyHealth <= 0 {
            removeUnit(enemyEntity, shouldDecreasePlayerHealth: false, shouldIncreaseScore: true, fullAnimation: false)
            gameEngine?.dropMana(at: enemyEntity)
        } else {
            gameEngine?.setGesture(for: enemyEntity, using: nil)
        }
    }

    func removeUnit(
        _ entity: Entity,
        shouldDecreasePlayerHealth: Bool,
        shouldIncreaseScore: Bool,
        fullAnimation: Bool
    ) {
        guard entity.type == .enemyEntity || entity.type == .playerUnitEntity else {
            return
        }
        
        if shouldDecreasePlayerHealth, (
            gameEngine?.isDivineShieldActivated == false
            || entity.component(ofType: EnemyTypeComponent.self)?.enemyType.isPowerUpImmune ?? true
            ) {
            gameEngine?.decreasePlayerHealth()
        } else if entity.type == .enemyEntity {
            gameEngine?.incrementCombo()
        }
        
        if shouldIncreaseScore, let scoreComponent = entity.component(ofType: ScoreComponent.self) {
            gameEngine?.addScore(by: scoreComponent.scorePoints)
        }
        
        if entity.type == .enemyEntity,
            let gestureEntity = entity.component(ofType: GestureEntityComponent.self)?.gestureEntity {
                gameEngine?.remove(gestureEntity)
        }

        removeUnitFromGameWithAnimation(entity, fullAnimation: fullAnimation)
    }
    
    func removeDroppedMana(_ entity: Entity) {
        guard let spriteComponent = entity.component(ofType: SpriteComponent.self),
            let renderNode = gameEngine?.renderNode else {
            return
        }
        
        let removalAnimation = SKAction.sequence([
            .animate(
                with: TextureContainer.manaRemovalTextures,
                timePerFrame: GameConfig.Unit.removalAnimationTimePerFrame,
                resize: false,
                restore: false
            ),
            .removeFromParent()
        ])
        
        // separate removal animation from entity
        let animationNode = SKSpriteNode()
        let length = (gameEngine?.renderNode?.size ?? UIScreen.main.bounds.size).width
            * GameConfig.GamePlayScene.removalAnimationWidthRatio
        animationNode.size = .init(width: length, height: length)
        animationNode.position = spriteComponent.node.position
        animationNode.run(removalAnimation)
        renderNode.addNodeToLayer(layer: .removalAnimationLayer, node: animationNode)

        gameEngine?.remove(entity)
    }
    
    /**
     Removes the `Unit` from the game.
     - Note: This method will first remove the `MoveComponent` to prevent
     the enemy from continuing to move. Then it will run the removal animation.
     Upon completion, the `GameEngine`'s `remove` method is called on
     the `EnemyEntity`.
     */
    private func removeUnitFromGameWithAnimation(_ entity: Entity, fullAnimation: Bool) {
        guard entity.type == .enemyEntity || entity.type == .playerUnitEntity,
            let spriteComponent = entity.component(ofType: SpriteComponent.self),
            let renderNode = gameEngine?.renderNode else {
                return
        }

        let animationTextures = fullAnimation
            ? TextureContainer.fullEnemyRemovalTextures
            : TextureContainer.halfEnemyRemovalTextures
        
        let removalAnimation = SKAction.sequence([
            .animate(
                with: animationTextures,
                timePerFrame: GameConfig.Unit.removalAnimationTimePerFrame,
                resize: false,
                restore: false
            ),
            .removeFromParent()
        ])
        
        // separate removal animation from entity
        let animationNode = SKSpriteNode()
        let length = (gameEngine?.renderNode?.size ?? UIScreen.main.bounds.size).width
            * GameConfig.GamePlayScene.removalAnimationWidthRatio
        animationNode.size = .init(width: length, height: length)
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
        renderNode.addNodeToLayer(layer: .removalAnimationLayer, node: animationNode)

        // Changing physicsBody to nil is necessary because SpriteComponent and PhysicsBody do not get
        // deinit immediately, leading to >1 contacts detected.
        spriteComponent.node.physicsBody = nil
        gameEngine?.remove(entity)
    }
}
