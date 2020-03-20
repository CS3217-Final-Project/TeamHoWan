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
    var powerUpType: PowerUpType {
        .icePrison
    }
    private weak var gameEngine: GameEngine?
    override var type: EntityType {
        .icePrisonPowerUpEntity
    }
    
    init(gameEngine: GameEngine, at position: CGPoint, with size: CGSize) {
        self.gameEngine = gameEngine
        super.init()
        
        let animationNode = getCastingAnimationNode(at: position, with: size)
        let animationSpriteComponent = SpriteComponent(node: animationNode)
        animationSpriteComponent.layerType = .powerUpAnimationLayer
        
        let node = SKSpriteNode(texture: nil)
        node.position = position
        node.physicsBody = .init(circleOfRadius: size.width / 2)
        node.physicsBody?.affectedByGravity = false
        
        let spriteComponent = SpriteComponent(node: node)
        spriteComponent.layerType = .powerUpAnimationLayer
        
        let teamComponent = TeamComponent(team: .player)
        
        addComponent(spriteComponent)
        addComponent(animationSpriteComponent)
        addComponent(teamComponent)
        
        // Timer will expire and cause the removal of the Power Up
        Timer.scheduledTimer(
            withTimeInterval: GameConfig.IcePrisonPowerUp.powerUpDuration,
            repeats: false,
            block: { [weak self] _ in
                animationNode.run(
                    .fadeOut(withDuration: GameConfig.IcePrisonPowerUp.fadeOutDuration),
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
