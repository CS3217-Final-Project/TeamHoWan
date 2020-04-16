//
//  CollisionPlayerUnitEnemyEndPoint.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

struct CollisionPlayerUnitEnemyEndPoint: Collision {
    func resolveCollision(firstEntity: Entity, secondEntity: Entity, gameEngine: GameEngine) {
        if firstEntity.type == .playerUnitEntity, secondEntity.type == .endPointEntity {
            resolveCollisionHelper(firstEntity, secondEntity, gameEngine: gameEngine)
        } else if firstEntity.type == .endPointEntity, secondEntity.type == .playerUnitEntity {
            resolveCollisionHelper(secondEntity, firstEntity, gameEngine: gameEngine)
        }
    }
    
    private func resolveCollisionHelper(_ firstEntity: Entity, _ secondEntity: Entity, gameEngine: GameEngine) {
        guard firstEntity.type == .playerUnitEntity, secondEntity.type == .endPointEntity,
            secondEntity.component(ofType: TeamComponent.self)?.team == .enemy else {
                return
        }
        
        gameEngine.unitReachedLine(firstEntity)
    }
}
