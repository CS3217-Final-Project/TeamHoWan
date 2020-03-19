//
//  DarkVortexPowerUpEntity.swift
//  GameOfRunes
//
//  Created by Brian Yen on 19/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class DarkVortexPowerUpEntity: Entity, PowerUpEntity {
    var powerUpType: PowerUpType
    private weak var gameEngine: GameEngine?
    override var type: EntityType {
        .darkVortexPowerUpEntity
    }

    init(gameEngine: GameEngine, at position: CGPoint, with size: CGSize) {
        self.powerUpType = .darkVortex
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
            radius: .init(spriteComponent.node.size.height)
        )

        addComponent(spriteComponent)
        addComponent(teamComponent)
        addComponent(moveComponent)

        Timer.scheduledTimer(withTimeInterval: GameConfig.DarkVortexPowerUp.powerUpDuration,
                             repeats: false,
                             block: {_ in
                                animationNode.run(.fadeOut(withDuration: GameConfig.DarkVortexPowerUp.fadeOutDuration),
                                                  completion: {
                                    gameEngine.remove(self)
                                })
        })
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
