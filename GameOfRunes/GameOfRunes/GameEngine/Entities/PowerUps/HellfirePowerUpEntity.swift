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
class HellfirePowerUpEntity: Entity, PowerUpEntity {
    var fading = false
    var powerUpType: PowerUpType {
        .hellfire
    }
    override var type: EntityType {
        .hellFirePowerUpEntity
    }
    
    init(at position: CGPoint, with size: CGSize) {
        super.init()

        let animationNode = Self.getAnimationNode(at: position, with: size, for: powerUpType)
        CollisionType.powerUp.setPhysicsBody(for: animationNode, with: size)
        
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.HellFirePowerUp.powerUpDuration)
        let animationSpriteComponent = SpriteComponent(node: animationNode, layerType: .powerUpAnimationLayer)
        
        addComponent(animationSpriteComponent)
        addComponent(timerComponent)
    }
}
