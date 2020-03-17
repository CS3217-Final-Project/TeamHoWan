//
//  EnemyEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class EnemyEntity: Entity {
    private weak var gameEngine: GameEngine?
    private let enemyType: EnemyType
    private (set) var gestureEntity: GestureEntity?

    init(enemyType: EnemyType, gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        self.enemyType = enemyType

        super.init()

        let spriteComponent = SpriteComponent(texture: TextureContainer.getEnemyTexture(enemyType))
        spriteComponent.node.run(
            .repeatForever(
                .animate(
                    with: TextureContainer.getEnemyAnimationTextures(enemyType),
                    timePerFrame: 0.1,
                    resize: false,
                    restore: true
                )
            )
        )

        let moveComponent = MoveComponent(
            gameEngine: gameEngine,
            maxSpeed: 150.0,
            maxAcceleration: 5.0,
            radius: .init(component(ofType: SpriteComponent.self)?.node.size.width ?? 0) * 0.01
        )
        let teamComponent = TeamComponent(team: .enemy)
        let healthComponent = HealthComponent(healthPoints: enemyType.health)

        addComponent(spriteComponent)
        addComponent(teamComponent)
        addComponent(healthComponent)
        addComponent(moveComponent)
        setCurrentGesture()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func getType() -> EntityType {
        return .enemyEntity
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

    /**
     Removes the `EnemyEntity` from the game.
     - Note: This method will first remove the `MoveComponent` to prevent
     the enemy from continuing to move. Then it will run the removal animation.
     Upon completion, the `GameEngine`'s `remove` method is called on
     the `EnemyEntity`.
     */
    func removeFromGame() {
        removeComponent(ofType: MoveComponent.self)
        
        let removalAnimation = SKAction.animate(with: TextureContainer.getEnemyRemovalAnimationTextures(),
                                                timePerFrame: GameplayConfiguration.Enemy.removalAnimationTimePerFrame,
                                                resize: true,
                                                restore: false)
        if let spriteComponent = component(ofType: SpriteComponent.self) {
            spriteComponent.node.run(removalAnimation) {
                [unowned self] in
                self.gameEngine?.remove(self)
            }
        }
    }
}
