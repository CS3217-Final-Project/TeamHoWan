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
    private unowned var gameEngine: GameEngine
    private let enemyType: EnemyType
    private (set) var gestureEntity: GestureEntity?
    
    init(enemyType: EnemyType, gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        self.enemyType = enemyType
            
        super.init()

        let spriteComponent = SpriteComponent(texture: enemyType.staticTexture)
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
        let teamComponent = TeamComponent(team: .enemy)
        let healthComponent = HealthComponent(healthPoints: 1)

        addComponent(spriteComponent)
        addComponent(teamComponent)
        addComponent(healthComponent)
        addMoveComponent()
        setCurrentGesture()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCurrentGesture() {
        guard let enemyNode = component(ofType: SpriteComponent.self)?.node else {
            return
        }
        
        var availableGestures = enemyType.gesturesAvailable
        
        if let currentGesture = gestureEntity?.component(ofType: GestureComponent.self)?.gesture {
            availableGestures.removeAll { $0 == currentGesture }
        }
        
        guard let gesture = availableGestures.randomElement() else {
            return
        }

        gestureEntity = GestureEntity(gesture: gesture, parent: self)
        gestureEntity?.component(ofType: SpriteComponent.self)?
            .setGestureConstraint(referenceNode: enemyNode)
    }

    func removeGesture() -> Bool {
        guard gestureEntity != nil else {
            return false
        }

        gestureEntity = nil
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
            radius: .init(component(ofType: SpriteComponent.self)?.node.size.width ?? 0) * 0.01
        )
        addComponent(moveComponent)
        gameEngine.systemManager.addComponent(moveComponent)
    }
}
