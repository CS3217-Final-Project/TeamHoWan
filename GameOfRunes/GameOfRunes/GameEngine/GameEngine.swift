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
    private (set) var systemManager: SystemManager!
    private (set) var removeDelegate: RemoveDelegate!
    private (set) var entities = [EntityType : Set<GKEntity>]()
    private var toRemoveEntities = Set<GKEntity>()
    weak var scene: SKScene?
    weak var gameStateMachine: GameStateMachine?
    var playerHealthEntity: PlayerHealthEntity? {
        entities[.playerHealthEntity]?.first as? PlayerHealthEntity
    }
    var playerManaEntity: PlayerManaEntity? {
        entities[.playerManaEntity]?.first as? PlayerManaEntity
    }
    private var playerManaEntity: PlayerManaEntity? {
        entities.compactMap({ $0 as? PlayerManaEntity }).first
    }
    private var droppedManaEntities = Set<DroppedManaEntity>()

    init(scene: SKScene, gameStateMachine: GameStateMachine) {
        self.scene = scene
        self.systemManager = SystemManager(gameEngine: self)
        self.removeDelegate = RemoveDelegate(gameEngine: self)
        self.gameStateMachine = gameStateMachine
        self.gameStateMachine?.gameEngine = self
        
        EntityType.allCases.forEach { entityType in
            entities[entityType] = Set()
        }
    }
    
    func add(_ entity: Entity) {
        guard entities[entity.getType()]?.insert(entity).inserted == true else {
            return
        }
        
        systemManager.addComponents(foundIn: entity)
    }
    
    func remove(_ entity: Entity) {
        guard entities[entity.getType()]?.remove(entity) != nil else {
            return
        }

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
        
        guard let gestureEntity = enemyEntity.gestureEntity else {
            return
        }
        
        add(enemyEntity)
        add(gestureEntity)
    }
    
    /** Gets all entities of a particular `Team`. */
    func entities(for team: Team) -> [GKEntity] {
        switch team {
        case .enemy:
            return Array(entities[.enemyEntity] ?? Set())
        case .player:
            return Array(entities[.endPointEntity] ?? Set())
        }
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
        for entity in entities[EntityType.gestureEntity] ?? Set() {
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

/** Extension for the Game Engine to deal with Mana-related events and logic. */
extension GameEngine: DroppedManaResponderType {
    /** Function called whenever a monster is killed and mana can be dropped. */
    func dropMana(at enemyEntity: GKEntity) {
        guard shouldDropMana() else {
            return
        }

        guard let enemySpriteComponent = enemyEntity.component(ofType: SpriteComponent.self) else {
            return
        }

        let position = enemySpriteComponent.node.position
        let manaPoints = getRandomManaPoints()
        let droppedManaEntity = DroppedManaEntity(position: position, manaPoints: manaPoints, gameEngine: self)

        droppedManaEntities.insert(droppedManaEntity)
        add(droppedManaEntity)
    }

    /**
     Checks if the Mana should be dropped.
     This method utilises a uniform distribution to ensure
     that the Mana is only dropped with probability determined
     by the value `GameplayConfiguration.Mana.manaDropProbaility`
     */
    private func shouldDropMana() -> Bool {
        let randNum = Double.random(in: 0.0...1.0)
        if randNum <= GameplayConfiguration.Mana.manaDropProbability {
            return true
        } else {
            return false
        }
    }

    /**
     Obtains a randomised value for the mana points associated with
     the `DroppedManaEntity` to be created. The upper and lower
     bounds for the mana points can be set in `GameplayConfiguration`
     */
    private func getRandomManaPoints() -> Int {
        let lowerBound = GameplayConfiguration.Mana.manaMinValue
        let upperBound = GameplayConfiguration.Mana.manaMaxValue
        return Int.random(in: lowerBound...upperBound)
    }

    /**
     Handler function called whenever the `DroppedManaNode` is tapped
     as part of conformance to the `DroppedManaResponderType` protocol.
     - Note: This function removes the Mana from screen, and increments
     the player's mana points.
     */
    func droppedManaTapped(droppedManaNode: DroppedManaNode) {
        for droppedManaEntity in droppedManaEntities {
            if let spriteComponent = droppedManaEntity.component(ofType: SpriteComponent.self),
                droppedManaNode === spriteComponent.node {
                increaseManaPoints(manaPoints: droppedManaEntity.manaPoints)
                removeDroppedMana(droppedManaEntity: droppedManaEntity)
            }
        }
    }

    /** Increases the Player's Mana points. */
    func increaseManaPoints(manaPoints: Int) {
        if let playerManaEntity = playerManaEntity,
            let playerManaComponent = playerManaEntity.component(ofType: ManaComponent.self) {
            playerManaComponent.manaPoints += manaPoints
        }
    }

    /** Decreaes the Player's Mana points. */
    func decreaseManaPoints(manaPoints: Int) {
        increaseManaPoints(manaPoints: -manaPoints)
    }

    /** Removes the dropped mana from View and Model. */
    func removeDroppedMana(droppedManaEntity: GKEntity) {
        remove(droppedManaEntity)
    }
}
