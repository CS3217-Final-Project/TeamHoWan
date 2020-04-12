//
//  ContactDelegate.swift
//  GameOfRunes
//
//  Created by Andy on 26/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class ContactDelegate: NSObject, SKPhysicsContactDelegate {
    private var dispatcher = [Pair<CollisionType>: Collision]()

    init(gameEngine: GameEngine) {
        let enemyUnitPlayerUnitCollision = CollisionEnemyUnitPlayerUnit(gameEngine)
        let enemyUnitPlayerUnitPair = Pair<CollisionType>(.enemyUnit, .playerUnit)
        let enemyUnitPowerUpCollision = CollisionEnemyUnitPowerUp(gameEngine)
        let enemyUnitPowerUpPair = Pair<CollisionType>(.enemyUnit, .powerUp)
        let enemyUnitPlayerEndPointCollision = CollisionEnemyUnitPlayerEndPoint(gameEngine)
        let enemyUnitPlayerEndPointPair = Pair<CollisionType>(.enemyUnit, .playerEndPoint)
        let playerUnitEnemyEndPointCollision = CollisionPlayerUnitEnemyEndPoint(gameEngine)
        let playerUnitEnemyEndPointPair = Pair<CollisionType>(.playerUnit, .enemyEndPoint)
        
        dispatcher[enemyUnitPlayerUnitPair] = enemyUnitPlayerUnitCollision
        dispatcher[enemyUnitPlayerUnitPair.reverse()] = enemyUnitPlayerUnitCollision
        dispatcher[enemyUnitPowerUpPair] = enemyUnitPowerUpCollision
        dispatcher[enemyUnitPowerUpPair.reverse()] = enemyUnitPowerUpCollision
        dispatcher[enemyUnitPlayerEndPointPair] = enemyUnitPlayerEndPointCollision
        dispatcher[enemyUnitPlayerEndPointPair.reverse()] = enemyUnitPlayerEndPointCollision
        dispatcher[playerUnitEnemyEndPointPair] = playerUnitEnemyEndPointCollision
        dispatcher[playerUnitEnemyEndPointPair.reverse()] = playerUnitEnemyEndPointCollision
    }
    
    // Contact detected by SpriteKit's physics system
    func didBegin(_ contact: SKPhysicsContact) {
        guard let entityA = contact.bodyA.node?.entity as? Entity,
            let entityB = contact.bodyB.node?.entity as? Entity,
            let entityACollisionType = CollisionType(rawValue: contact.bodyA.categoryBitMask),
            let entityBCollisionType = CollisionType(rawValue: contact.bodyB.categoryBitMask) else {
                return
        }
        
        dispatcher[Pair(entityACollisionType, entityBCollisionType)]?
            .resolveCollision(firstEntity: entityA, secondEntity: entityB)
    }
}
