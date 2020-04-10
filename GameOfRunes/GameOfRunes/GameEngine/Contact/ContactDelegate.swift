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
        dispatcher[Pair(.enemyUnit, .playerUnit)] = CollisionEnemyUnitPlayerUnit(gameEngine)
        dispatcher[Pair(.enemyUnit, .powerUp)] = CollisionEnemyUnitPowerUp(gameEngine)
        dispatcher[Pair(.enemyUnit, .playerEndPoint)] = CollisionEnemyUnitPlayerEndPoint(gameEngine)
        dispatcher[Pair(.playerUnit, .enemyEndPoint)] = CollisionPlayerUnitEnemyEndPoint(gameEngine)
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
