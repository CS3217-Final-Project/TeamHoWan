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
    private let spriteComponent: SpriteComponent
    let manaPoints: Int
    override var type: EntityType {
        .endPointEntity
    }
    
    init(position: CGPoint, manaPoints: Int, gameEngine: GameEngine) {
        let node = DroppedManaNode(position: position, responder: gameEngine)
        node.zPosition = GameConfig.GamePlayScene.manaDropLayerZPosition
        self.manaPoints = manaPoints

        // Create and Animate Sprite Component
        self.spriteComponent = SpriteComponent(droppedManaNode: node)
        spriteComponent.node.run(
            .repeatForever(
                .animate(
                    with: TextureContainer.getManaAnimationTextures(),
                    timePerFrame: 0.05,
                    resize: false,
                    restore: true
                )
            )
        )
        super.init()
        addComponent(self.spriteComponent)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
