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
        guard let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node else {
            return
        }
        
        let isBodyAEnemy = contact.bodyA.categoryBitMask == CollisionType.enemy.rawValue
        let isBodyBEnemy = contact.bodyB.categoryBitMask == CollisionType.enemy.rawValue
        
        // Only concerned if one of the nodes are enemy nodes (XOR), BUT NOT BOTH (shouldn't occur)
        if isBodyAEnemy, !isBodyBEnemy {
            enemyNodeContactWithOther(enemyNode: nodeA, other: nodeB)
        } else if !isBodyAEnemy, isBodyBEnemy {
            enemyNodeContactWithOther(enemyNode: nodeB, other: nodeA)
        }
    }
    
    private func enemyNodeContactWithOther(enemyNode: SKNode, other: SKNode) {
        guard let enemyEntity = enemyNode.entity as? Entity,
            enemyEntity.type == .enemyEntity,
            let otherEntity = other.entity as? Entity else {
                return
        }
        
        switch otherEntity.type {
        case .endPointEntity:
            gameEngine?.enemyReachedLine(enemyEntity)
        case .hellFirePowerUpEntity, .icePrisonPowerUpEntity, .darkVortexPowerUpEntity:
            guard let powerUpComponent = otherEntity.component(ofType: PowerUpComponent.self) else {
                    return
            }
            
            didActivate(powerUp: powerUpComponent.powerUpType, on: enemyEntity)
        default:
            return
        }
    }
    
    private func didActivate(powerUp: PowerUpType, on enemy: Entity) {
        guard enemy.type == .enemyEntity else {
            return
        }
        
        switch powerUp {
        case .hellfire:
            gameEngine?.enemyForceRemoved(enemy)
        case .icePrison:
            gameEngine?.stopMovement(for: enemy, duration: GameConfig.IcePrisonPowerUp.powerUpDuration)
        default:
            return
        }
    }
}
