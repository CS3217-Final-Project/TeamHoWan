//
//  HellfireEntity.swift
//  GameOfRunes
//
//  Created by Andy on 19/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

/** Entity to represent the Hellfire Power Up */
class HellfirePowerUpEntity: PowerUpEntity {
    override var type: EntityType {
        .hellFirePowerUpEntity
    }
    
    init(gameEngine: GameEngine, at position: CGPoint, with size: CGSize) {
        super.init()

        let animationNode = getAnimationNode(for: .hellfire, at: position, with: size)
        let animationSpriteComponent = SpriteComponent(node: animationNode)
        animationSpriteComponent.layerType = .powerUpAnimationLayer
        
        animationNode.component = animationSpriteComponent
        animationNode.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 4)
        animationNode.physicsBody?.affectedByGravity = false
        animationNode.physicsBody?.categoryBitMask = CollisionType.powerUp.rawValue
        animationNode.physicsBody?.contactTestBitMask = CollisionType.enemy.rawValue
        animationNode.physicsBody?.collisionBitMask = 0

        let timerComponent = TimerComponent(initialTimerValue: GameConfig.HellFirePowerUp.powerUpDuration)
        let powerUpComponent = PowerUpComponent(.hellfire)
        
        addComponent(animationSpriteComponent)
        addComponent(timerComponent)
        addComponent(powerUpComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
