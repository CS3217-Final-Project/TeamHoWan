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
    override var type: EntityType {
        .droppedManaEntity
    }

    init(position: CGPoint, manaPoints: Int, gameEngine: GameEngine) {
        super.init()

        let manaNode = DroppedManaNode(position: position, responder: gameEngine)
        // save a weak reference to itself inside the node
        manaNode.droppedManaEntity = self

        // Create and Animate Sprite Component
        let spriteComponent = SpriteComponent(node: manaNode, layerType: .manaDropLayer)
        spriteComponent.node.run(
            .repeatForever(
                .animate(
                    with: TextureContainer.getManaTextures(manaType: ManaType.getManaType(manaPoints: manaPoints)),
                    timePerFrame: 0.05,
                    resize: false,
                    restore: true
                )
            )
        )
        
        addComponent(spriteComponent)
        addComponent(ManaComponent(manaPoints: manaPoints))
    }
}
