//
//  CollisionEnemyUnitPlayerUnit.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

struct CollisionEnemyUnitPlayerUnit: Collision {
    init(_ gameEngine: GameEngine) {
        self.gameEngine = gameEngine
    }
    
    func resolveCollision(firstEntity: Entity, secondEntity: Entity) {
        if firstEntity.type == .enemyEntity, secondEntity.type == .playerUnitEntity {
            resolveCollisionHelper(firstEntity, secondEntity)
        } else if firstEntity.type == .playerUnitEntity, secondEntity.type == .enemyEntity {
            resolveCollisionHelper(secondEntity, firstEntity)
        }
    }
    
    private func resolveCollisionHelper(_ firstEntity: Entity, _ secondEntity: Entity) {
        guard firstEntity.type == .enemyEntity, secondEntity.type == .playerUnitEntity else {
            return
        }
        
        gameEngine?.unitForceRemoved(firstEntity)
        gameEngine?.unitForceRemoved(secondEntity)
    }
}
