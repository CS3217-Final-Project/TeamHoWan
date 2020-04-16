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

    override init() {
        let enemyUnitPlayerUnitCollision = CollisionEnemyUnitPlayerUnit()
        let enemyUnitPlayerUnitPair = Pair<CollisionType>(.enemyUnit, .playerUnit)
        let enemyUnitPowerUpCollision = CollisionEnemyUnitPowerUp()
        let enemyUnitPowerUpPair = Pair<CollisionType>(.enemyUnit, .powerUp)
        let enemyUnitPlayerEndPointCollision = CollisionEnemyUnitPlayerEndPoint()
        let enemyUnitPlayerEndPointPair = Pair<CollisionType>(.enemyUnit, .playerEndPoint)
        let playerUnitEnemyEndPointCollision = CollisionPlayerUnitEnemyEndPoint()
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
        // Check that the Collision is Between Nodes rooted at the same RootRenderNode
        // (so that only collisions within the local game or within the remote game are considered)
        guard let rootRenderNodeA = contact.bodyA.node?.parent?.parent as? RootRenderNode,
            let rootRenderNodeB = contact.bodyB.node?.parent?.parent as? RootRenderNode,
            rootRenderNodeA == rootRenderNodeB,
            let gameEngine = rootRenderNodeA.gameEngine as? GameEngine else {
                return
        }

        guard let entityA = contact.bodyA.node?.entity as? Entity,
            let entityB = contact.bodyB.node?.entity as? Entity,
            let entityACollisionType = CollisionType(rawValue: contact.bodyA.categoryBitMask),
            let entityBCollisionType = CollisionType(rawValue: contact.bodyB.categoryBitMask) else {
                return
        }
        
        dispatcher[Pair(entityACollisionType, entityBCollisionType)]?
            .resolveCollision(firstEntity: entityA, secondEntity: entityB, gameEngine: gameEngine)
    }
}
