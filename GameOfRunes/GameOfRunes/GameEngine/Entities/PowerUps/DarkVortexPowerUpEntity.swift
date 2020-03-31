//
//  DarkVortexPowerUpEntity.swift
//  GameOfRunes
//
//  Created by Brian Yen on 19/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

/** Entity to represent the Dark Vortex Power Up */
class DarkVortexPowerUpEntity: AttractionEntity, PowerUpEntity {
    var fading = false
    var powerUpType: PowerUpType {
        .darkVortex
    }
    override var type: EntityType {
        .darkVortexPowerUpEntity
    }
    
    init(at position: CGPoint, with size: CGSize) {
        let animationNode = Self.getAnimationNode(at: position, with: size, for: .darkVortex)
        super.init(node: animationNode, layerType: .powerUpAnimationLayer, team: .player)
        
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.HellFirePowerUp.powerUpDuration)
        
        addComponent(timerComponent)
    }
}
