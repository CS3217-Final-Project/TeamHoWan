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
class DarkVortexPowerUpEntity: Entity {
    override var type: EntityType {
        .powerUpEntity
    }
    
    init(at position: CGPoint, with size: CGSize) {
        super.init()
        
        let powerUp = DarkVortexPowerUp.self
        let animationNode = powerUp.getAnimationNode(at: position, with: size, powerUp: powerUp)
        let attractionEntity = AttractionEntity(node: animationNode,
                                                layerType: .powerUpAnimationLayer,
                                                team: .player,
                                                parent: self)
        
        let timerComponent = TimerComponent(initialTimerValue: powerUp.duration)
        let powerUpComponent = PowerUpComponent(powerUp.type)
        let attractionEntitiesComponent = AttractionEntitiesComponent(attractionEntity)
        
        addComponent(timerComponent)
        addComponent(powerUpComponent)
        addComponent(attractionEntitiesComponent)
    }
}
