//
//  PowerUpEntity.swift
//  GameOfRunes
//
//  Created by Brian Yen on 19/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class PowerUpEntity: Entity {
    private weak var gameEngine: GameEngine?
    private let powerUpType: PowerUpType
    override var type: EntityType {
        .powerUpEntity
    }

    init(gameEngine: GameEngine, powerUpType: PowerUpType,
         at position: CGPoint, with size: CGSize, on node: SKNode) {
        self.gameEngine = gameEngine
        self.powerUpType = powerUpType
        super.init()

        let animationNode = SKSpriteNode(texture: nil, color: .clear, size: size)
        animationNode.position = position
        var powerUpCastAnimation: SKAction?
        var powerUpAnimation: SKAction?

        if let powerUpCastTextures = PowerUpType.powerUpCastsTextures[powerUpType] {
            powerUpCastAnimation = .animate(with: powerUpCastTextures, timePerFrame: 0.1, resize: false, restore: false)
        }

        if let powerUpTextures = PowerUpType.powerUpsTextures[powerUpType] {
            powerUpAnimation = SKAction.repeatForever(
                    .animate(with: powerUpTextures, timePerFrame: 0.05, resize: false, restore: false)
            )
        }

        let animationAction = SKAction.sequence([
            powerUpCastAnimation ?? SKAction(),
            powerUpAnimation ?? SKAction()
        ])

        // TODO: Remember to fade out and remove animations from parent (`.removeFromParent()`?

        let soundAction = SKAction.playSoundFileNamed("cast power up", waitForCompletion: false)

        animationNode.run(SKAction.group([animationAction, soundAction]))
        //TODO: The following line is problematic: consider not
        //using SpriteSystem/Component at all and just adding the node
        //directly to the animationLayer
//        node.addChild(animationNode)

        let spriteComponent = SpriteComponent(node: animationNode)
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

        Timer.scheduledTimer(withTimeInterval: 5,
                             repeats: false,
                             block: {_ in
                                gameEngine.remove(self)
        })
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
