//
//  CollisionEnemyUnitPowerUp.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

struct CollisionEnemyUnitPowerUp: Collision {
    func resolveCollision(firstEntity: Entity, secondEntity: Entity, gameEngine: GameEngine) {
        if firstEntity.type == .enemyEntity, secondEntity.type == .powerUpEntity {
            resolveCollisionHelper(firstEntity, secondEntity, gameEngine: gameEngine)
        } else if firstEntity.type == .powerUpEntity, secondEntity.type == .enemyEntity {
            resolveCollisionHelper(secondEntity, firstEntity, gameEngine: gameEngine)
        }
    }
    
    private func resolveCollisionHelper(_ firstEntity: Entity, _ secondEntity: Entity, gameEngine: GameEngine) {
        guard firstEntity.type == .enemyEntity, secondEntity.type == .powerUpEntity,
            let powerUpType = secondEntity.component(ofType: PowerUpComponent.self)?.powerUpType,
            let powerUp = powerUpType.powerUp as? Collidable.Type else {
                return
        }

        powerUp.effectUponCollision(on: firstEntity, gameEngine: gameEngine)
    }
}
