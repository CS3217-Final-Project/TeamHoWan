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
            removeEnemyFromGame(enemyEntity)
            gameEngine?.dropMana(at: enemyEntity)
            return
        }
        
        enemyEntity.setCurrentGesture()
        
        if let nextGesture = enemyEntity.gestureEntity {
            gameEngine?.add(nextGesture)
        }
    }
    
    func removeEnemyReachedLine(_ entity: EnemyEntity) {
        removeEnemyFromGame(entity)
        gameEngine?.decreasePlayerHealth()

        guard let gestureEntity = entity.gestureEntity else {
            return
        }

        gameEngine?.remove(gestureEntity)
    }
    
    /**
     Removes the `EnemyEntity` from the game.
     - Note: This method will first remove the `MoveComponent` to prevent
     the enemy from continuing to move. Then it will run the removal animation.
     Upon completion, the `GameEngine`'s `remove` method is called on
     the `EnemyEntity`.
     */
    private func removeEnemyFromGame(_ entity: EnemyEntity) {
        entity.removeComponent(ofType: MoveComponent.self)
        
        guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else {
            return
        }

        let removalAnimation = SKAction.animate(with: TextureContainer.getEnemyRemovalAnimationTextures(),
                                                timePerFrame: GameConfig.Enemy.removalAnimationTimePerFrame,
                                                resize: true,
                                                restore: false)

        spriteComponent.node.run(removalAnimation) { [weak self] in
            self?.gameEngine?.remove(entity)
        }
    }
}
