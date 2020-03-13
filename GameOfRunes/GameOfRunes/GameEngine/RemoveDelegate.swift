//
//  RemoveDelegate.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class RemoveDelegate {
    private unowned var gameEngine: GameEngine
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
    }
    
    func removeGesture(for entity: GKEntity) {
        guard let gestureEntity = entity as? GestureEntity,
            let enemyEntity = gestureEntity.parentEntity as? EnemyEntity else {
            return
        }

        guard let enemyHealth = gameEngine.minusHealthPoints(for: enemyEntity) else {
            return
        }

        gameEngine.remove(gestureEntity)
        
        if enemyHealth <= 0 {
            gameEngine.remove(enemyEntity)
            return
        }
        
        enemyEntity.setCurrentGesture()
        
        if let nextGesture = enemyEntity.gestureEntity {
            gameEngine.add(nextGesture)
        }
    }
    
    func removeEnemyReachedLine(_ entity: EnemyEntity) {
        gameEngine.remove(entity)

        guard let gestureEntity = entity.gestureEntity else {
            return
        }

        gameEngine.remove(gestureEntity)
    }
}
