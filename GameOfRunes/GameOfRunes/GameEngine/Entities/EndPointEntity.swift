//
//  EndPointEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class EndPointEntity: Entity {
    override var type: EntityType {
        .endPointEntity
    }
    
    init(gameEngine: GameEngine, node: SKSpriteNode) {
        super.init()
        
        guard let node = node as? CollisionNode else {
            return
        }
        
        let spriteComponent = SpriteComponent(node: node)
        node.component = spriteComponent
        node.physicsBody = SKPhysicsBody(rectangleOf: node.size, center: node.position)
        node.physicsBody?.affectedByGravity = false
        node.physicsBody?.categoryBitMask = CollisionType.endpoint.rawValue
        node.physicsBody?.contactTestBitMask = CollisionType.enemy.rawValue
        node.physicsBody?.collisionBitMask = 0

        node.addGlow()
        spriteComponent.layerType = .playerAreaLayer
        let teamComponent = TeamComponent(team: .player)
        let moveComponent = MoveComponent(
            gameEngine: gameEngine,
            maxSpeed: 0.0,
            maxAcceleration: 0.0,
            radius: .init(spriteComponent.node.size.height)
        )
        
        addComponent(spriteComponent)
        addComponent(teamComponent)
        addComponent(moveComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
