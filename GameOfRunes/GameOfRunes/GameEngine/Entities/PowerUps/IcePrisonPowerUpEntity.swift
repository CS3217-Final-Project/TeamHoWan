//
//  IcePrisonPowerUpEntity.swift
//  GameOfRunes
//
//  Created by Andy on 19/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

/** Entity to represent the Hellfire Power Up */
class IcePrisonPowerUpEntity: Entity, PowerUpEntity {
    var powerUpType: PowerUpType {
        .icePrison
    }
    private weak var gameEngine: GameEngine?
    override var type: EntityType {
        .icePrisonPowerUpEntity
    }
    
    init(gameEngine: GameEngine, at position: CGPoint, with size: CGSize) {
        self.gameEngine = gameEngine
        super.init()
        
        let animationNode = getCastingAnimationNode(at: position, with: size)
        let animationSpriteComponent = SpriteComponent(node: animationNode)
        animationSpriteComponent.layerType = .powerUpAnimationLayer
        animationNode.component = animationSpriteComponent

        guard let texture = animationNode.texture else {
            return
        }
        animationNode.physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        animationNode.physicsBody?.affectedByGravity = false
        animationNode.physicsBody?.categoryBitMask = CollisionType.powerUp.rawValue
        animationNode.physicsBody?.contactTestBitMask = CollisionType.enemy.rawValue
        animationNode.physicsBody?.collisionBitMask = 0
        
        addComponent(animationSpriteComponent)
        
        // Timer will expire and cause the removal of the Power Up
        Timer.scheduledTimer(
            withTimeInterval: GameConfig.IcePrisonPowerUp.powerUpDuration,
            repeats: false,
            block: { [weak self] _ in
                animationNode.run(
                    .fadeOut(withDuration: GameConfig.IcePrisonPowerUp.fadeOutDuration),
                    completion: {
                        guard let entity = self else {
                            return
                        }
                        gameEngine.remove(entity)
                    }
                )
            }
        )
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
