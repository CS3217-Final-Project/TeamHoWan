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
    
    func didBegin(_ contact: SKPhysicsContact) {
        let isBodyAEnemy = contact.bodyA.categoryBitMask == CollisionType.enemy.rawValue
        let isBodyAEndPoint = contact.bodyA.categoryBitMask == CollisionType.endpoint.rawValue
        let isBodyAPowerUp = contact.bodyA.categoryBitMask == CollisionType.powerUp.rawValue
        let isBodyBEnemy = contact.bodyB.categoryBitMask == CollisionType.enemy.rawValue
        let isBodyBEndPoint = contact.bodyB.categoryBitMask == CollisionType.endpoint.rawValue
        let isBodyBPowerUp = contact.bodyB.categoryBitMask == CollisionType.powerUp.rawValue
    
        guard let nodeA = contact.bodyA.node as? CollisionNode,
            let nodeB = contact.bodyB.node as? CollisionNode else {
                return
        }
        
        if isBodyAEnemy {
            guard let enemyEntity = nodeA.component?.entity else {
                return
            }
            if isBodyBEndPoint {
                gameEngine?.enemyReachedLine(enemyEntity)
            } else if isBodyBPowerUp {
                guard let powerUpEntity = nodeB.component?.entity as? PowerUpEntity else {
                    return
                }
                activatePowerUp(on: enemyEntity, powerUpType: powerUpEntity.powerUpType)
            }
        } else if isBodyBEnemy {
            guard let enemyEntity = nodeB.component?.entity else {
                return
            }
            if isBodyAEndPoint {
                gameEngine?.enemyReachedLine(enemyEntity)
            } else if isBodyAPowerUp {
                guard let powerUpEntity = nodeA.component?.entity as? PowerUpEntity else {
                    return
                }
                activatePowerUp(on: enemyEntity, powerUpType: powerUpEntity.powerUpType)
            }
        }
    }
    
    func activatePowerUp(on enemy: GKEntity, powerUpType: PowerUpType) {
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
