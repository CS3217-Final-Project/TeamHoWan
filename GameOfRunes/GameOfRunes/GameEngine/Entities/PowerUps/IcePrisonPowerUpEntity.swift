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
class IcePrisonPowerUpEntity: Entity, PowerUpEntity {
    var fading = false
    var powerUpType: PowerUpType {
        .icePrison
    }
    override var type: EntityType {
        .icePrisonPowerUpEntity
    }
    
    init(at position: CGPoint, with size: CGSize) {
        super.init()
        
        let animationNode = Self.getCastingAnimationNode(at: position, with: size, for: powerUpType)
        CollisionType.powerUp.setPhysicsBody(for: animationNode, with: size)
        
        let animationSpriteComponent = SpriteComponent(node: animationNode, layerType: .powerUpAnimationLayer)
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.IcePrisonPowerUp.fadeOutDuration)
        
        addComponent(animationSpriteComponent)
        addComponent(timerComponent)
    }
}
