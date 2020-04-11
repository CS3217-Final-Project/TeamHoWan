//
//  DivineBlessingPowerUpEntity.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 2/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class DivineBlessingPowerUpEntity: Entity {
    override var type: EntityType {
        .powerUpEntity
    }
    
    init(at position: CGPoint, with size: CGSize) {
        super.init()
        
        let powerUpType: PowerUpType = .divineBlessing
        let powerUp = DivineBlessingPowerUp.shared
        
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
