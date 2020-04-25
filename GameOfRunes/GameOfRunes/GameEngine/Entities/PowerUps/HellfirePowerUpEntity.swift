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
    override var type: EntityType {
        .powerUpEntity
    }

    init(at position: CGPoint, with size: CGSize) {
        super.init()
        
        let powerUpType: PowerUpType = .hellfire
        let powerUp = HellfirePowerUp.self
        
        let animationNode = powerUp.getAnimationNode(at: position, with: size, powerUp: powerUp)
        CollisionType.powerUp.setPhysicsBody(for: animationNode, with: size)
        
        let timerComponent = TimerComponent(initialTimerValue: powerUp.duration)
        let animationSpriteComponent = SpriteComponent(node: animationNode, layerType: .powerUpAnimationLayer)
        let powerUpComponent = PowerUpComponent(powerUpType)
        
        addComponent(animationSpriteComponent)
        addComponent(timerComponent)
        addComponent(powerUpComponent)
    }
}
