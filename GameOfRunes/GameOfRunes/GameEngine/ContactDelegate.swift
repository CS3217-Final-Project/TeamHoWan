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
        guard let entityA = contact.bodyA.node?.entity as? Entity,
            let entityB = contact.bodyB.node?.entity as? Entity,
            let entityACollisionType = CollisionType(rawValue: contact.bodyA.categoryBitMask),
            let entityBCollisionType = CollisionType(rawValue: contact.bodyB.categoryBitMask) else {
            return
        }
        
        let sortedOrder = [(entity: entityA, collisionType: entityACollisionType),
                           (entity: entityB, collisionType: entityBCollisionType)]
            .sorted(by: { $0.collisionType < $1.collisionType })
        
        let firstPair = sortedOrder[0]
        let secondPair = sortedOrder[1]
        
        switch firstPair.collisionType {
        case .enemyUnit:
            guard firstPair.entity.type == .enemyEntity else {
                return
            }
            
            switch secondPair.collisionType {
            case .playerUnit:
                guard secondPair.entity.type == .playerUnitEntity else {
                    return
                }
                gameEngine?.unitForceRemoved(firstPair.entity)
                gameEngine?.unitForceRemoved(secondPair.entity)
            case .playerEndPoint:
                guard secondPair.entity.type == .endPointEntity else {
                    return
                }
                gameEngine?.unitReachedLine(firstPair.entity)
            case .powerUp:
                guard let powerUpType = secondPair.entity
                    .component(ofType: PowerUpComponent.self)?
                    .powerUpType,
                    let gameEngine = gameEngine else {
                        return
                }
                powerUpType.didActivate(on: firstPair.entity, gameEngine: gameEngine)
            default:
                return
            }
        case .playerUnit:
            guard firstPair.entity.type == .playerUnitEntity,
                secondPair.entity.type == .endPointEntity,
                secondPair.collisionType == .enemyEndPoint else {
                return
            }
            gameEngine?.unitReachedLine(firstPair.entity)
        default:
            return
        }
    }
}
