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

        guard enemyEntity.removeGesture(for: gestureEntity), let enemyHealth =
            gameEngine.minusHealthPoints(for: enemyEntity) else {
            return
        }

        gameEngine.remove(gestureEntity)
        
        if enemyHealth <= 0 {
            gameEngine.remove(enemyEntity)
        } else {
            // TODO: switch to next enemy gesture
        }
    }
    
    func removeEnemyReachedLine(_ entity: EnemyEntity) {
        gameEngine.remove(entity)
        
        for gestureEntity in entity.gestureEntities {
            gameEngine.remove(gestureEntity)
        }
    }
}
