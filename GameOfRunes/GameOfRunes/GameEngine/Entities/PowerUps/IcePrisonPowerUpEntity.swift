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
class IcePrisonPowerUpEntity: PowerUpEntity {
    override var type: EntityType {
        .icePrisonPowerUpEntity
    }
    
    init(gameEngine: GameEngine, at position: CGPoint, with size: CGSize) {
        super.init()
        
        let animationNode = getCastingAnimationNode(for: .icePrison, at: position, with: size)
        let animationSpriteComponent = SpriteComponent(node: animationNode)
        animationSpriteComponent.layerType = .powerUpAnimationLayer
        animationNode.component = animationSpriteComponent
       
        animationNode.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 4)
        animationNode.physicsBody?.affectedByGravity = false
        animationNode.physicsBody?.categoryBitMask = CollisionType.powerUp.rawValue
        animationNode.physicsBody?.contactTestBitMask = CollisionType.enemy.rawValue
        animationNode.physicsBody?.collisionBitMask = 0
        
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.IcePrisonPowerUp.fadeOutDuration)
        let powerUpComponnet = PowerUpComponent(.icePrison)
        
        addComponent(animationSpriteComponent)
        addComponent(timerComponent)
        addComponent(powerUpComponnet)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
