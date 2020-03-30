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
    
    init(gameEngine: GameEngine, at position: CGPoint) {
        super.init()
        
        let radius = (gameEngine.gameScene?.size.width ?? 0) / 3
        let size = CGSize(width: radius, height: radius)
        let animationNode = getAnimationNode(for: .darkVortex, at: position, with: size)
        let spriteComponent = SpriteComponent(node: animationNode)
        spriteComponent.layerType = .powerUpAnimationLayer
        
        let teamComponent = TeamComponent(team: .player)
        let moveComponent = MoveComponent(
            gameEngine: gameEngine,
            maxSpeed: 0.0,
            maxAcceleration: 0.0,
            radius: .init(spriteComponent.node.size.width)
        )
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.HellFirePowerUp.powerUpDuration)
        let powerUpComponent = PowerUpComponent(.darkVortex)
        
        addComponent(timerComponent)
        addComponent(spriteComponent)
        addComponent(teamComponent)
        addComponent(moveComponent)
        addComponent(powerUpComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
