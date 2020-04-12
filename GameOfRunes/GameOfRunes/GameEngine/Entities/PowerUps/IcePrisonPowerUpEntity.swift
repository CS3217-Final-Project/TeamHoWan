//
//  IcePrisonPowerUpEntity.swift
//  GameOfRunes
//
//  Created by Andy on 19/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

/** Entity to represent the Ice Prison Power Up */
class IcePrisonPowerUpEntity: Entity {
    override var type: EntityType {
        .powerUpEntity
    }
    
    init(at position: CGPoint, with size: CGSize) {
        super.init()
        
        let powerUpType: PowerUpType = .icePrison
        let powerUp = IcePrisonPowerUp.shared
        
        let animationNode = powerUp.getAnimationNode(at: position, with: size, powerUp: powerUp)
        CollisionType.powerUp.setPhysicsBody(for: animationNode, with: size)
        
        let animationSpriteComponent = SpriteComponent(node: animationNode, layerType: .powerUpAnimationLayer)
        let timerComponent = TimerComponent(initialTimerValue: powerUp.duration)
        let powerUpComponent = PowerUpComponent(powerUpType)
        powerUpComponent.fading = true
        
        addComponent(animationSpriteComponent)
        addComponent(timerComponent)
        addComponent(powerUpComponent)
    }
}
