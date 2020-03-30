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
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        
    }
    
    // Contact detected by SpriteKit's physics system
    func didBegin(_ contact: SKPhysicsContact) {
        let isBodyAEnemy = contact.bodyA.categoryBitMask == CollisionType.enemy.rawValue
        let isBodyBEnemy = contact.bodyB.categoryBitMask == CollisionType.enemy.rawValue
    
        guard let nodeA = contact.bodyA.node as? CollisionNode,
            let nodeB = contact.bodyB.node as? CollisionNode else {
                return
        }
        
        // Only concerned if one of the nodes are enemy nodes
        if isBodyAEnemy {
            enemyNodeContactWithOther(enemyNode: nodeA, other: nodeB)
        } else if isBodyBEnemy {
            enemyNodeContactWithOther(enemyNode: nodeB, other: nodeA)
        }
    }
    
    func enemyNodeContactWithOther(enemyNode: CollisionNode, other: CollisionNode) {
        guard let enemyEntity = enemyNode.component?.entity as? Entity else {
            return
        }
        
        if other.component?.entity is PowerUpEntity {
            guard let powerUpEntity = other.component?.entity as? PowerUpEntity else {
                return
            }
            activatePowerUp(on: enemyEntity, powerUpType: powerUpEntity.powerUpType)
        } else if other.component?.entity is EndPointEntity {
            gameEngine?.enemyReachedLine(enemyEntity)
        }
    }
    
    func activatePowerUp(on enemy: Entity, powerUpType: PowerUpType) {
        switch powerUpType {
        case .hellfire:
            gameEngine?.enemyForceRemoved(enemy)
        case .icePrison:
            gameEngine?.stopMovement(for: enemy, duration: GameConfig.IcePrisonPowerUp.powerUpDuration)
        default:
            return
        }
    }
}
