//
//  ColliderEnum.swift
//  GameOfRunes
//
//  Created by Andy on 26/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum CollisionType: UInt32 {
    case enemyUnit = 0b000001
    case playerUnit = 0b000010
    case playerEndPoint = 0b000100
    case enemyEndPoint = 0b001000
    case powerUp = 0b010000
    
    func setPhysicsBody(for node: SKSpriteNode, with size: CGSize) {
        guard size.width > 0, size.height > 0 else {
            return
        }
        
        switch self {
        case .enemyUnit:
            node.physicsBody = .init(circleOfRadius: size.height / 2)
            node.physicsBody?.affectedByGravity = false
            node.physicsBody?.categoryBitMask = rawValue
            node.physicsBody?.contactTestBitMask = CollisionType.playerEndPoint.rawValue
                | CollisionType.powerUp.rawValue
                | CollisionType.playerUnit.rawValue
            node.physicsBody?.collisionBitMask = 0
        case .playerUnit:
            node.physicsBody = .init(circleOfRadius: size.height / 2)
            node.physicsBody?.affectedByGravity = false
            node.physicsBody?.categoryBitMask = rawValue
            node.physicsBody?.contactTestBitMask = CollisionType.enemyEndPoint.rawValue
                | CollisionType.enemyUnit.rawValue
            node.physicsBody?.collisionBitMask = 0
        case .playerEndPoint:
            node.physicsBody = .init(rectangleOf: size)
            node.physicsBody?.affectedByGravity = false
            node.physicsBody?.categoryBitMask = rawValue
            node.physicsBody?.contactTestBitMask = CollisionType.enemyUnit.rawValue
            node.physicsBody?.collisionBitMask = 0
        case .enemyEndPoint:
            node.physicsBody = .init(rectangleOf: size)
            node.physicsBody?.affectedByGravity = false
            node.physicsBody?.categoryBitMask = rawValue
            node.physicsBody?.contactTestBitMask = CollisionType.playerUnit.rawValue
            node.physicsBody?.collisionBitMask = 0
        case .powerUp:
            node.physicsBody = .init(circleOfRadius: size.width / 2)
            node.physicsBody?.affectedByGravity = false
            node.physicsBody?.categoryBitMask = rawValue
            node.physicsBody?.contactTestBitMask = CollisionType.enemyUnit.rawValue
            node.physicsBody?.collisionBitMask = 0
        }
    }
}
