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
    var powerUpType: PowerUp = DarkVortexPowerUp.shared
    
    override var type: EntityType {
        .powerUpEntity
    }
    
    init(at position: CGPoint, with size: CGSize) {
        super.init()
        
        guard let powerUpType = powerUpType as? DarkVortexPowerUp else {
            return
        }
        
        let animationNode = powerUpType.getAnimationNode(at: position, with: size, powerUpType: powerUpType)
        let attractionEntity = AttractionEntity(node: animationNode,
                                                layerType: .powerUpAnimationLayer,
                                                team: .player,
                                                parent: self)
        
        let timerComponent = TimerComponent(initialTimerValue: powerUpType.duration)
        let powerUpComponent = PowerUpComponent(powerUpType)
        let attractionEntitiesComponent = AttractionEntitiesComponent(attractionEntity)
        
        addComponent(timerComponent)
        addComponent(powerUpComponent)
        addComponent(attractionEntitiesComponent)
    }
}
