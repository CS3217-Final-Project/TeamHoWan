//
//  CollisionEnemyUnitPlayerUnit.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

struct CollisionEnemyUnitPlayerUnit: Collision {
    func resolveCollision(firstEntity: Entity, secondEntity: Entity, gameEngine: GameEngine) {
        if firstEntity.type == .enemyEntity, secondEntity.type == .playerUnitEntity {
            resolveCollisionHelper(firstEntity, secondEntity, gameEngine: gameEngine)
        } else if firstEntity.type == .playerUnitEntity, secondEntity.type == .enemyEntity {
            resolveCollisionHelper(secondEntity, firstEntity, gameEngine: gameEngine)
        }
    }
    
    private func resolveCollisionHelper(_ firstEntity: Entity, _ secondEntity: Entity, gameEngine: GameEngine) {
        guard firstEntity.type == .enemyEntity, secondEntity.type == .playerUnitEntity else {
            return
        }
        
        gameEngine.unitForceRemoved(firstEntity)
        gameEngine.unitForceRemoved(secondEntity)
    }
}
