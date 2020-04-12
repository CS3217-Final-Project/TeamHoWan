//
//  CollisionEnemyUnitPlayerEndPoint.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

struct CollisionEnemyUnitPlayerEndPoint: Collision {
    private weak var gameEngine: GameEngine?
    
    init(_ gameEngine: GameEngine) {
        self.gameEngine = gameEngine
    }
    
    func resolveCollision(firstEntity: Entity, secondEntity: Entity) {
        if firstEntity.type == .enemyEntity, secondEntity.type == .endPointEntity {
            resolveCollisionHelper(firstEntity, secondEntity)
        } else if firstEntity.type == .endPointEntity, secondEntity.type == .enemyEntity {
            resolveCollisionHelper(secondEntity, firstEntity)
        }
    }
    
    private func resolveCollisionHelper(_ firstEntity: Entity, _ secondEntity: Entity) {
        guard firstEntity.type == .enemyEntity, secondEntity.type == .endPointEntity,
            secondEntity.component(ofType: TeamComponent.self)?.team == .player else {
                return
        }
        
        gameEngine?.unitReachedLine(firstEntity)
    }
}
