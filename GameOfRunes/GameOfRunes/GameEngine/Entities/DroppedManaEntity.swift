//
//  DroppedManaEntity.swift
//  GameOfRunes
//
//  Created by Brian Yen on 15/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class DroppedManaEntity: GKEntity {
    private let spriteComponent: SpriteComponent
    let manaPoints: Int

    init(position: CGPoint, manaPoints: Int, gameEngine: GameEngine) {
        let node = DroppedManaNode(position: position, responder: gameEngine)
        self.manaPoints = manaPoints
        node.zPosition = 100
        self.spriteComponent = SpriteComponent(droppedManaNode: node)
        spriteComponent.node.run(
            .repeatForever(
                .animate(
                    with: TextureContainer.getManaAnimationTextures(),
                    timePerFrame: 0.1,
                    resize: true,
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
