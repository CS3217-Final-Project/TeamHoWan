//
//  GameEngine.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameEngine {
    var systemManager: SystemManager!
    var removeDelegate: RemoveDelegate!
    var entities = Set<GKEntity>()
    var toRemoveEntities = Set<GKEntity>()
    weak var scene: SKScene?
    weak var gameStateMachine: GameStateMachine?
    private var playerHealthEntity: PlayerHealthEntity? {
        entities.compactMap({ $0 as? PlayerHealthEntity }).first
    }

    init(scene: SKScene, gameStateMachine: GameStateMachine) {
        self.scene = scene
        self.systemManager = SystemManager(gameEngine: self)
        self.removeDelegate = RemoveDelegate(gameEngine: self)
        self.gameStateMachine = gameStateMachine
        self.gameStateMachine?.gameEngine = self
    }
    
    func add(_ entity: GKEntity) {
        guard entities.insert(entity).inserted else {
            return
        }

        systemManager.addComponents(foundIn: entity)
    }
    
    func remove(_ entity: GKEntity) {
        entities.remove(entity)
        toRemoveEntities.insert(entity)
    }
    
    func update(with deltaTime: TimeInterval) {
        systemManager.update(with: deltaTime)

        toRemoveEntities.forEach { entity in
            systemManager.removeComponents(foundIn: entity)
        }

        toRemoveEntities.removeAll()
        
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
        let enemyEntity = EnemyEntity(enemyType: EnemyType.allCases.randomElement() ?? .orc1, gameEngine: self)
        if let spriteComponent = enemyEntity.component(ofType: SpriteComponent.self),
            let sceneSize = scene?.size {
            spriteComponent.node.position = .init(
                x: .random(in: sceneSize.width * 0.25 ... sceneSize.width * 0.75),
                y: sceneSize.height - 100
            )
            spriteComponent.node.size = spriteComponent.node.size.scaleTo(width: sceneSize.width / 6)
        }
        
        guard let gestureEntity = enemyEntity.gestureEntities.first else {
            return
        }
        
        add(enemyEntity)
        add(gestureEntity)
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
    
    func gestureActivated(gesture: CustomGesture) {
        for entity in entities {
            guard let gestureComponent = entity.component(ofType: GestureComponent.self), gestureComponent.gesture == gesture else {
                continue
            }

            removeDelegate.removeGesture(for: entity)
        }
    }
    
    func minusHealthPoints(for entity: GKEntity) -> Int? {
        return systemManager.minusHealthPoints(for: entity)
    }
    
    func enemyReachedLine(_ entity: GKEntity) {
        guard let enemyEntity = entity as? EnemyEntity else {
            return
        }

        removeDelegate.removeEnemyReachedLine(enemyEntity)
    }
}
