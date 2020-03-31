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
class DarkVortexPowerUpEntity: PowerUpEntity {
    override var type: EntityType {
        .darkVortexPowerUpEntity
    }
    
    init(at position: CGPoint, with size: CGSize) {
        let animationNode = PowerUpType.darkVortex.getAnimationNode(at: position, with: size)
        super.init()
        
        // TODO: Add an attraction entity.
        // super.init(node: animationNode, layerType: .powerUpAnimationLayer, team: .player)
        
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.HellFirePowerUp.powerUpDuration)
        let powerUpComponent = PowerUpComponent(.darkVortex)
        
        addComponent(timerComponent)
        addComponent(powerUpComponent)
    }
}
