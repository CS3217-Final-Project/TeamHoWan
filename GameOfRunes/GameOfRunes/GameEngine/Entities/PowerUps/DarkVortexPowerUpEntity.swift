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
class DarkVortexPowerUpEntity: Entity, PowerUp {
    var powerUpType: PowerUpType {
        .darkVortex
    }
    
    override var type: EntityType {
        .powerUpEntity
    }
    
    init(at position: CGPoint, with size: CGSize) {
        let animationNode = PowerUpType.darkVortex.getAnimationNode(at: position, with: size)
        super.init()
        
        let attractionEntity = AttractionEntity(node: animationNode,
                                                layerType: .powerUpAnimationLayer,
                                                team: .player,
                                                parent: self)
        
        let timerComponent = TimerComponent(initialTimerValue: powerUpType.duration)
        let powerUpComponent = PowerUpComponent(.darkVortex)
        let attractionEntitiesComponent = AttractionEntitiesComponent(attractionEntity)
        
        addComponent(timerComponent)
        addComponent(powerUpComponent)
        addComponent(attractionEntitiesComponent)
    }
}
