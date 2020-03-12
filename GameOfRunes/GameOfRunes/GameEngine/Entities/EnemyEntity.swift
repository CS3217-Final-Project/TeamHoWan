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
    private (set) var gestureEntities: [GestureEntity] = []
    private unowned var gameEngine: GameEngine
    
    init(enemyType: EnemyType, gameEngine: GameEngine) {
        self.gameEngine = gameEngine

        super.init()

        let enemyAtlas = SKTextureAtlas(named: enemyType.rawValue)
        let spriteComponent = SpriteComponent(texture: enemyAtlas.textureNamed("WALK_002"))
        let teamComponent = TeamComponent(team: .enemy)
        let healthComponent = HealthComponent(healthPoints: 1)

        addComponent(spriteComponent)
        addComponent(teamComponent)
        addComponent(healthComponent)
        addMoveComponent()
        addGestures(enemyType: enemyType, enemyNode: spriteComponent.node)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addGestures(enemyType: EnemyType, enemyNode: SKSpriteNode) {
        let nextGesture = GestureEntity(gesture: .arrowUp, parent: self)
        nextGesture.component(ofType: SpriteComponent.self)?.setGestureConstraint(referenceNode: enemyNode)
        gestureEntities.append(nextGesture)
    }

    func removeGesture(for entity: GestureEntity) -> Bool {
        guard gestureEntities.first === entity else {
            return false
        }

        gestureEntities.removeFirst()
        return true
    }

    /** Helper function to remove MoveComponent from EnemyEntity */
    func removeMoveComponent() {
        removeComponent(ofType: MoveComponent.self)
    }

    /** Helper function to add MoveComponent to EnemyEntity */
    func addMoveComponent() {
        let moveComponent = MoveComponent(
            maxSpeed: 150.0,
            maxAcceleration: 5.0,
            radius: .init(component(ofType: SpriteComponent.self)?.node.size.width ?? 0) * 0.01,
            gameEngine: gameEngine
        )
        addComponent(moveComponent)
        gameEngine.systemManager.addComponent(moveComponent)
    }
}
