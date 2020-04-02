//
//  SubstitutionPowerUpEntity.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 2/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit
import SpriteKit

class SubstitutionPowerUpEntity: Entity {
    override var type: EntityType {
        .substitutionPowerUpEntity
    }
    
    init(at position: CGPoint, with size: CGSize) {
        super.init()
        
        let animationNode = PowerUpType.substitution.getCastingAnimationNode(at: position, with: size)
        CollisionType.powerUp.setPhysicsBody(for: animationNode, with: size)
        
        let animationSpriteComponent = SpriteComponent(node: animationNode, layerType: .powerUpAnimationLayer)
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.SubstituionPowerUp.fadeOutDuration)
        let powerUpComponent = PowerUpComponent(.substitution)
        powerUpComponent.fading = true
        
        addComponent(animationSpriteComponent)
        addComponent(timerComponent)
        addComponent(powerUpComponent)
    }
}
