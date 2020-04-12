//
//  CollisionPlayerUnitEnemyEndPoint.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

struct CollisionPlayerUnitEnemyEndPoint: Collision {
    private weak var gameEngine: GameEngine?
    
    init(_ gameEngine: GameEngine) {
        self.gameEngine = gameEngine
    }
    
    func resolveCollision(firstEntity: Entity, secondEntity: Entity) {
        if firstEntity.type == .playerUnitEntity, secondEntity.type == .endPointEntity {
            resolveCollisionHelper(firstEntity, secondEntity)
        } else if firstEntity.type == .endPointEntity, secondEntity.type == .playerUnitEntity {
            resolveCollisionHelper(secondEntity, firstEntity)
        }
    }
    
    private func resolveCollisionHelper(_ firstEntity: Entity, _ secondEntity: Entity) {
        guard firstEntity.type == .playerUnitEntity, secondEntity.type == .endPointEntity,
            secondEntity.component(ofType: TeamComponent.self)?.team == .enemy else {
                return
        }
        
        gameEngine?.unitReachedLine(firstEntity)
    }
}
