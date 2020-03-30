//
//  ColliderEnum.swift
//  GameOfRunes
//
//  Created by Andy on 26/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum CollisionType: UInt32 {
    case enemy = 0b000001
    case endpoint = 0b000010
    case powerUp = 0b000100
    
    func setPhysicsBody(for node: SKSpriteNode, with size: CGSize) {
        print(node.size)
        print(size)
        switch self {
        case .enemy:
            node.physicsBody = .init(circleOfRadius: size.height / 2)
            node.physicsBody?.affectedByGravity = false
            node.physicsBody?.categoryBitMask = rawValue
            node.physicsBody?.contactTestBitMask = CollisionType.endpoint.rawValue | CollisionType.powerUp.rawValue
            node.physicsBody?.collisionBitMask = 0
        case .endpoint:
            node.physicsBody = .init(rectangleOf: size)
            node.physicsBody?.affectedByGravity = false
            node.physicsBody?.categoryBitMask = rawValue
            node.physicsBody?.contactTestBitMask = CollisionType.enemy.rawValue
            node.physicsBody?.collisionBitMask = 0
        case .powerUp:
            node.physicsBody = .init(circleOfRadius: size.width / 2)
            node.physicsBody?.affectedByGravity = false
            node.physicsBody?.categoryBitMask = rawValue
            node.physicsBody?.contactTestBitMask = CollisionType.enemy.rawValue
            node.physicsBody?.collisionBitMask = 0
        }
    }
}
