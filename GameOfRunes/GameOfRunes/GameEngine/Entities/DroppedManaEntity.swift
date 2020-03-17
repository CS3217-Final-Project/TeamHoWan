//
//  DroppedManaEntity.swift
//  GameOfRunes
//
//  Created by Brian Yen on 15/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 Entity to reprsent the Mana dropped by killed monsters in the game.
 - Note: `manaPoints` refers to the amount of Mana Points gained
 when `DroppedManaNode` is tapped
 */
class DroppedManaEntity: Entity {
    init(position: CGPoint, manaPoints: Int, gameEngine: GameEngine) {
        super.init()

        guard let manaResponder = gameEngine.droppedManaResponder else {
            return
        }

        let node = DroppedManaNode(position: position, responder: manaResponder)
        node.zPosition = 100

        // Create and Animate Sprite Component
        let spriteComponent = SpriteComponent(droppedManaNode: node)
        spriteComponent.node.run(
            .repeatForever(
                .animate(
                    with: TextureContainer.getManaAnimationTextures(),
                    timePerFrame: 0.1,
                    resize: false,
                    restore: true
                )
            )
        )
        
        addComponent(spriteComponent)
        addComponent(ManaComponent(manaPoints: manaPoints))
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func getType() -> EntityType {
        return .droppedManaEntity
    }
}
