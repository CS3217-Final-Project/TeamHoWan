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
class HellfirePowerUpEntity: Entity {
    var powerUpType: PowerUp = HellfirePowerUp.shared
    
    override var type: EntityType {
        .powerUpEntity
    }

    init(at position: CGPoint, with size: CGSize) {
        super.init()

        guard let powerUpType = powerUpType as? HellfirePowerUp else {
            return
        }
        
        let animationNode = powerUpType.getAnimationNode(at: position, with: size, powerUpType: powerUpType)
        CollisionType.powerUp.setPhysicsBody(for: animationNode, with: size)
        
        let timerComponent = TimerComponent(initialTimerValue: powerUpType.duration)
        let animationSpriteComponent = SpriteComponent(node: animationNode, layerType: .powerUpAnimationLayer)
        let powerUpComponent = PowerUpComponent(powerUpType)
        
        addComponent(animationSpriteComponent)
        addComponent(timerComponent)
        addComponent(powerUpComponent)
    }
}
