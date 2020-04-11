//
//  CollisionEnemyUnitPowerUp.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

struct CollisionEnemyUnitPowerUp: Collision {
    private weak var gameEngine: GameEngine?
    
    init(_ gameEngine: GameEngine) {
        self.gameEngine = gameEngine
    }
    
    func resolveCollision(firstEntity: Entity, secondEntity: Entity) {
        if firstEntity.type == .enemyEntity, secondEntity.type == .powerUpEntity {
            resolveCollisionHelper(firstEntity, secondEntity)
        } else if firstEntity.type == .powerUpEntity, secondEntity.type == .enemyEntity {
            resolveCollisionHelper(secondEntity, firstEntity)
        }
    }
    
    private func resolveCollisionHelper(_ firstEntity: Entity, _ secondEntity: Entity) {
        guard firstEntity.type == .enemyEntity, secondEntity.type == .powerUpEntity,
            let powerUpType = secondEntity.component(ofType: PowerUpComponent.self)?.powerUpType,
            let powerUp = powerUpType.powerUp as? Collidable,
            let gameEngine = gameEngine else {
                return
        }

        powerUp.effectUponCollision(on: firstEntity, gameEngine: gameEngine)
    }
}
