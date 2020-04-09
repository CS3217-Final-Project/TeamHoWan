//
//  DivineShieldPowerUpEntity.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 2/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class DivineShieldPowerUpEntity: Entity, PowerUp {
    var powerUpType: PowerUpType {
        .divineShield
    }
    
    override var type: EntityType {
        .powerUpEntity
    }
    
    init(at position: CGPoint, with size: CGSize) {
        super.init()
        
        let animationNode = PowerUpType.divineShield.getCastingAnimationNode(at: position, with: size)
        
        let animationSpriteComponent = SpriteComponent(node: animationNode, layerType: .powerUpAnimationLayer)
        let timerComponent = TimerComponent(initialTimerValue: powerUpType.duration)
        let powerUpComponent = PowerUpComponent(powerUpType)
        
        addComponent(animationSpriteComponent)
        addComponent(timerComponent)
        addComponent(powerUpComponent)
    }
}
