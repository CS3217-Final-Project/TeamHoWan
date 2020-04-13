//
//  CollisionEnemyUnitPlayerEndPoint.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

struct CollisionEnemyUnitPlayerEndPoint: Collision {
    func resolveCollision(firstEntity: Entity, secondEntity: Entity, gameEngine: GameEngine) {
        if firstEntity.type == .enemyEntity, secondEntity.type == .endPointEntity {
            resolveCollisionHelper(firstEntity, secondEntity, gameEngine: gameEngine)
        } else if firstEntity.type == .endPointEntity, secondEntity.type == .enemyEntity {
            resolveCollisionHelper(secondEntity, firstEntity, gameEngine: gameEngine)
        }
    }
    
    private func resolveCollisionHelper(_ firstEntity: Entity, _ secondEntity: Entity, gameEngine: GameEngine) {
        guard firstEntity.type == .enemyEntity, secondEntity.type == .endPointEntity,
            secondEntity.component(ofType: TeamComponent.self)?.team == .player else {
                return
        }
        
        gameEngine.unitReachedLine(firstEntity)
    }
}
