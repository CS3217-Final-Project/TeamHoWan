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
class DarkVortexPowerUpEntity: Entity, PowerUpEntity {
    var powerUpType: PowerUpType {
        .darkVortex
    }
    private weak var gameEngine: GameEngine?
    override var type: EntityType {
        .darkVortexPowerUpEntity
    }

    init(gameEngine: GameEngine, at position: CGPoint, with size: CGSize) {
        self.gameEngine = gameEngine
        super.init()

        let animationNode = getAnimationNode(at: position, with: size)
        let spriteComponent = SpriteComponent(node: animationNode)
        spriteComponent.layerType = .powerUpAnimationLayer
        
        let teamComponent = TeamComponent(team: .player)
        let moveComponent = MoveComponent(
            gameEngine: gameEngine,
            maxSpeed: 0.0,
            maxAcceleration: 0.0,
            radius: .init(spriteComponent.node.size.width)
        )
    
        addComponent(spriteComponent)
        addComponent(teamComponent)
        addComponent(moveComponent)
        
        // Timer will expire and cause the removal of the Power Up
        Timer.scheduledTimer(
            withTimeInterval: GameConfig.DarkVortexPowerUp.powerUpDuration,
            repeats: false,
            block: { [weak self] _ in
                animationNode.run(
                    .fadeOut(withDuration: GameConfig.DarkVortexPowerUp.fadeOutDuration),
                    completion: {
                        guard let entity = self else {
                            return
                        }
                        gameEngine.remove(entity)
                    }
                )
            }
        )
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
