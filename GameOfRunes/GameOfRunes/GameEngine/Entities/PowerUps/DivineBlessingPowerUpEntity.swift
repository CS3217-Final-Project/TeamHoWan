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
    var powerUpType: PowerUp = DivineBlessingPowerUp.shared
    
    override var type: EntityType {
        .powerUpEntity
    }
    
    init(at position: CGPoint, with size: CGSize) {
        super.init()
        
        guard let powerUpType = powerUpType as? DivineBlessingPowerUp else {
            return
        }
        
        let animationNode = powerUpType.getAnimationNode(at: position, with: size, powerUpType: powerUpType)
        CollisionType.powerUp.setPhysicsBody(for: animationNode, with: size)
        
        let animationSpriteComponent = SpriteComponent(node: animationNode, layerType: .powerUpAnimationLayer)
        let timerComponent = TimerComponent(initialTimerValue: powerUpType.duration)
        let powerUpComponent = PowerUpComponent(powerUpType)
        powerUpComponent.fading = true
        
        addComponent(animationSpriteComponent)
        addComponent(timerComponent)
        addComponent(powerUpComponent)
    }
}
