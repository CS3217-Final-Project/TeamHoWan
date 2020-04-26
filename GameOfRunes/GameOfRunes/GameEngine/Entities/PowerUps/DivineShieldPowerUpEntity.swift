//
//  DivineShieldPowerUpEntity.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 2/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class DivineShieldPowerUpEntity: Entity {
    override var type: EntityType {
        .powerUpEntity
    }
    
    init(at position: CGPoint, with size: CGSize) {
        super.init()

        let powerUp = DivineShieldPowerUp.self
        
        let animationNode = powerUp.getAnimationNode(at: position, with: size, powerUp: powerUp)
        let animationSpriteComponent = SpriteComponent(node: animationNode, layerType: .powerUpAnimationLayer)
        let timerComponent = TimerComponent(initialTimerValue: powerUp.duration)
        let powerUpComponent = PowerUpComponent(powerUp.type)
        
        addComponent(animationSpriteComponent)
        addComponent(timerComponent)
        addComponent(powerUpComponent)
    }
}
