//
//  ContactDelegate.swift
//  GameOfRunes
//
//  Created by Andy on 26/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class ContactDelegate: NSObject, SKPhysicsContactDelegate {
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let isBodyAEnemy = contact.bodyA.categoryBitMask == ColliderType.enemy.rawValue
        let isBodyAEndPoint = contact.bodyA.categoryBitMask == ColliderType.endpoint.rawValue
        let isBodyAPowerUp = contact.bodyA.categoryBitMask == ColliderType.powerUp.rawValue
        let isBodyBEnemy = contact.bodyB.categoryBitMask == ColliderType.enemy.rawValue
        let isBodyBEndPoint = contact.bodyB.categoryBitMask == ColliderType.endpoint.rawValue
        let isBodyBPowerUp = contact.bodyB.categoryBitMask == ColliderType.powerUp.rawValue
        
        if isBodyAEnemy {
            
        } else if isBodyBEnemy {
            
        }
    }
}
