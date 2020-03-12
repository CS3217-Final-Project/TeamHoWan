//
//  EnemyEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class EnemyEntity: GKEntity {
    private let spriteComponent: SpriteComponent
    private let teamComponent: TeamComponent
    private let gestureComponent: GestureComponent
    private weak var entityManager: EntityManager?

    init(enemyType: EnemyType, entityManager: EntityManager) {
        spriteComponent = SpriteComponent(texture: enemyType.staticTexture)
        spriteComponent.node.run(
            .repeatForever(
                .animate(
                    with: enemyType.animationTextures,
                    timePerFrame: 0.1,
                    resize: false,
                    restore: true
                )
            )
        )
        teamComponent = TeamComponent(team: .enemy)
        gestureComponent = GestureComponent(gesture: .arrowUp)
        self.entityManager = entityManager
        
        super.init()
        addComponent(gestureComponent)
        addComponent(spriteComponent)
        addComponent(teamComponent)
        addMoveComponent()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /** Helper function to remove MoveComponent from EnemyEntity */
    func removeMoveComponent() {
        removeComponent(ofType: MoveComponent.self)
    }

    /** Helper function to add MoveComponent to EnemyEntity */
    func addMoveComponent() {
        guard let entityManager = entityManager else {
            return
        }
        let moveComponent = MoveComponent(
            maxSpeed: 150.0,
            maxAcceleration: 5.0,
            radius: .init(spriteComponent.node.size.width) * 0.01,
            entityManager: entityManager
        )
        addComponent(moveComponent)
    }
}
