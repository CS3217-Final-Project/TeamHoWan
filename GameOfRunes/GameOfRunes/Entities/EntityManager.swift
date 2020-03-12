//
//  EntityManager.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 Class to manage all Entities within the game.
 */
class EntityManager {
    lazy var componentSystems: [GKComponentSystem] = {
        let manaSystem = GKComponentSystem(componentClass: ManaComponent.self)
        let moveSystem = GKComponentSystem(componentClass: MoveComponent.self)
        return [manaSystem, moveSystem]
    }()
    
    var entities = Set<GKEntity>()
    var toRemoveEntities = Set<GKEntity>()
    weak var scene: SKScene?
    weak var gameStateMachine: GameStateMachine?
    private var playerHealthEntity: PlayerHealthEntity? {
        entities.filter({ $0.component(ofType: HealthComponent.self) != nil }).first as? PlayerHealthEntity
    }
    
    init(scene: SKScene, gameStateMachine: GameStateMachine) {
        self.scene = scene
        self.gameStateMachine = gameStateMachine
        self.gameStateMachine?.entityManager = self
    }
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene?.addChild(spriteNode)
            
            if let gestureNode = entity.component(ofType: GestureComponent.self)?.node {
                scene?.addChild(gestureNode)
                
                let xRange = SKRange(constantValue: GameplayConfiguration.Enemy.gestureBubbleOffset.x)
                let yRange = SKRange(constantValue: GameplayConfiguration.Enemy.gestureBubbleOffset.y)

                let constraint = SKConstraint.positionX(xRange, y: yRange)
                constraint.referenceNode = spriteNode
                
                gestureNode.constraints = [constraint]
            }
        }
        
        componentSystems.forEach { $0.addComponent(foundIn: entity) }
    }
    
    func remove(_ entity: GKEntity) {
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
            
            if let gestureNode = entity.component(ofType: GestureComponent.self)?.node {
                gestureNode.removeFromParent()
            }
        }
        
        entities.remove(entity)
        toRemoveEntities.insert(entity)
    }
    
    func update(with deltaTime: CFTimeInterval) {
        componentSystems.forEach { $0.update(deltaTime: deltaTime) }
        toRemoveEntities.forEach { entity in
            componentSystems.forEach { componentSystem in
                componentSystem.removeComponent(foundIn: entity)
            }
        }
        toRemoveEntities = []

        // Player Loses the Game
        if let playerHealthEntity = playerHealthEntity,
            let playerHealthComponent = playerHealthEntity.component(ofType: HealthComponent.self),
            playerHealthComponent.healthPoints <= 0,
            let gameStateMachine = gameStateMachine,
            let gameEndState = gameStateMachine.state(forClass: GameEndState.self) {
            gameEndState.didWin = false
            gameStateMachine.enter(GameEndState.self)
        }
    }
    
    func spawnEnemy() {        
        let enemyEntity = EnemyEntity(enemyType: EnemyType.allCases.randomElement() ?? .orc1, entityManager: self)
        if let spriteComponent = enemyEntity.component(ofType: SpriteComponent.self),
            let sceneSize = scene?.size {
            spriteComponent.node.position = .init(
                x: .random(in: sceneSize.width * 0.25 ... sceneSize.width * 0.75),
                y: sceneSize.height - 100
            )
            spriteComponent.node.size = spriteComponent.node.size.scaleTo(width: sceneSize.width / 6)
        }
        add(enemyEntity)
    }

    /** Gets all entities of a particular `Team`. */
    func entities(for team: Team) -> [GKEntity] {
        entities.compactMap { $0.component(ofType: TeamComponent.self)?.team == team ? $0 : nil }
    }

    /** Gets all the `MoveComponents` of entities in a particular `Team` */
    func moveComponents(for team: Team) -> [MoveComponent] {
        let entitiesToMove = entities(for: team)
        return entitiesToMove.compactMap { $0.component(ofType: MoveComponent.self) }
    }

    /** Decrements the Player's health by 1 point. */
    func decreasePlayerHealth() {
        if let playerHealthEntity = playerHealthEntity,
            let playerHealthComponent = playerHealthEntity.component(ofType: HealthComponent.self) {
            playerHealthComponent.healthPoints -= 1
        }
    }

    /**
     Removes all `EnemyEntity`s whose `GestureComponent` corresponds
     to `gesture`.
     */
    func removeMonstersWithGesture(gesture: CustomGesture) {
        for enemyEntity in entities(for: .enemy) {
            guard let gestureComponent = enemyEntity.component(ofType: GestureComponent.self) else {
                continue
            }
            guard gestureComponent.gesture != gesture else {
                continue
            }
            self.remove(enemyEntity)
        }
    }
}
