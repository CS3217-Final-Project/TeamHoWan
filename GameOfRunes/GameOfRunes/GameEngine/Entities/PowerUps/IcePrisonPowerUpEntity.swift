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
    
    init(at position: CGPoint, with size: CGSize) {
        super.init()
        
        let animationNode = PowerUpType.icePrison.getCastingAnimationNode(at: position, with: size)
        CollisionType.powerUp.setPhysicsBody(for: animationNode, with: size)
        
        let animationSpriteComponent = SpriteComponent(node: animationNode, layerType: .powerUpAnimationLayer)
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.IcePrisonPowerUp.fadeOutDuration)
        let powerUpComponent = PowerUpComponent(.icePrison)
        
        addComponent(animationSpriteComponent)
        addComponent(timerComponent)
        addComponent(powerUpComponent)
    }
}
