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

        let node = DroppedManaNode(position: position, responder: gameEngine)

        // Create and Animate Sprite Component
        let spriteComponent = SpriteComponent(droppedManaNode: node)
        spriteComponent.layerType = .manaDropLayer
        spriteComponent.node.run(
            .repeatForever(
                .animate(
                    with: TextureContainer.getManaTextures(manaType: getManaType(manaPoints: manaPoints)),
                    timePerFrame: 0.05,
                    resize: false,
                    restore: true
                )
            )
        )
        
        // save a weak reference to itself inside the node
        node.droppedManaEntity = self
        
        addComponent(spriteComponent)
        addComponent(ManaComponent(manaPoints: manaPoints))
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TODO: Refactor once meta-data is completed
    private func getManaType(manaPoints: Int) -> ManaType {
        let max = GameConfig.Mana.manaMaxValue
        let min = GameConfig.Mana.manaMinValue
        
        let percentile = Double((manaPoints - min)) / Double((max - min)) * 100
        
        switch percentile {
        case 90...:
            return .ultraRare
        case 60...:
            return .rare
        default:
            return .common
        }
    }
}
