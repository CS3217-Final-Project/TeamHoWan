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
    private var systemDelegate: SystemDelegate!
    private var removeDelegate: RemoveDelegate!
    private var entities = [EntityType: Set<Entity>]()
    private var toRemoveEntities = Set<Entity>()
    weak var gameScene: GameScene?
    weak var gameStateMachine: GameStateMachine?

    var playerHealthEntity: PlayerHealthEntity? {
        entities[.playerHealthEntity]?.first as? PlayerHealthEntity
    }
    var playerManaEntity: PlayerManaEntity? {
        entities[.playerManaEntity]?.first as? PlayerManaEntity
    }

    init(gameScene: GameScene, gameStateMachine: GameStateMachine?) {
        self.gameScene = gameScene
        self.gameStateMachine = gameStateMachine
        self.systemDelegate = SystemDelegate(gameEngine: self)
        self.removeDelegate = RemoveDelegate(gameEngine: self)
        
        EntityType.allCases.forEach { entityType in
            entities[entityType] = Set()
        }
    }
    
    func add(_ entity: Entity) {
        guard entities[entity.type]?.insert(entity).inserted == true else {
            return
        }
        
        systemDelegate.addComponents(foundIn: entity)
    }
    
    func remove(_ entity: Entity) {
        guard entities[entity.type]?.remove(entity) != nil else {
            return
        }

        toRemoveEntities.insert(entity)
    }
    
    func removeComponent(_ component: Component) {
        systemDelegate.removeComponent(component)
    }
    
    func update(with deltaTime: TimeInterval) {
        systemDelegate.update(with: deltaTime)

        toRemoveEntities.forEach { entity in
            systemDelegate.removeComponents(foundIn: entity)
        }

        toRemoveEntities = []
        
        // Player Loses the Game
        if let playerHealthPoints =
            playerHealthEntity?.component(ofType: HealthComponent.self)?.healthPoints,
            playerHealthPoints <= 0,
            let gameEndState = gameStateMachine?.state(forClass: GameEndState.self) {
            gameEndState.didWin = false
            gameStateMachine?.enter(GameEndState.self)
        }
    }
    
    func spawnEnemy() {
        let enemyEntity = EnemyEntity(enemyType: EnemyType.allCases.randomElement() ?? .orc1, gameEngine: self)
        if let spriteComponent = enemyEntity.component(ofType: SpriteComponent.self),
            let sceneSize = gameScene?.size {
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
    func entities(for team: Team) -> [Entity] {
        switch team {
        case .enemy:
            return Array(entities[.enemyEntity] ?? Set())
        case .player:
            if let endPointEntity = entities[.endPointEntity],
                let darkVortexPowerUpEntities = entities[.darkVortexPowerUpEntity] {
                return Array(endPointEntity.union(darkVortexPowerUpEntities))
            }
            return []
        }
    }
    
    func entities(for type: EntityType) -> Set<Entity> {
        entities[type] ?? Set()
    }
    
    /** Gets all the `MoveComponents` of entities in a particular `Team` */
    func moveComponents(for team: Team) -> [MoveComponent] {
        let entitiesToMove = entities(for: team)
        return entitiesToMove.compactMap { $0.component(ofType: MoveComponent.self) }
    }
    
    /** Decrements the Player's health by 1 point. */
    func decreasePlayerHealth() {
        guard let playerHealthEntity = playerHealthEntity else {
            return
        }
        
        _ = minusHealthPoints(for: playerHealthEntity)
    }
    
    func gestureActivated(gesture: CustomGesture) {
        for entity in entities[.gestureEntity] ?? Set() {
            guard let gestureComponent =
                entity.component(ofType: GestureComponent.self),
                gestureComponent.gesture == gesture else {
                continue
            }
            
            removeDelegate.removeGesture(for: entity)
        }
    }
    
    func minusHealthPoints(for entity: GKEntity) -> Int? {
        systemDelegate.minusHealthPoints(for: entity)
    }
    
    func enemyReachedLine(_ entity: GKEntity) {
        guard let enemyEntity = entity as? EnemyEntity else {
            return
        }

        removeDelegate.removeEnemyReachedLine(enemyEntity)
    }
    
    func dropMana(at entity: GKEntity) {
        systemDelegate.dropMana(at: entity)
    }
    
    func increasePlayerMana(by manaPoints: Int) {
        guard let playerManaEntity = playerManaEntity else {
            return
        }
        
        systemDelegate.increaseMana(by: manaPoints, for: playerManaEntity)
    }

    func decreasePlayerMana(by manaPoints: Int) {
        increasePlayerMana(by: -manaPoints)
    }

    func didActivatePowerUp(powerUp: PowerUpType, at position: CGPoint, with size: CGSize = .zero) -> Bool {
        guard let gameScene = gameScene,
            let playerManaEntity = playerManaEntity,
            let currentManaPoints = systemDelegate.getMana(for: playerManaEntity) else {
                fatalError("Invalid call to didActivatePowerUp")
        }
                                                        // TODO: change this once game meta-data is up
        let manaPointsRequired = powerUp.manaUnitCost * gameScene.playerAreaNode.manaBarNode.manaPointsPerUnit
        
        guard currentManaPoints >= manaPointsRequired else {
            // did not activate
            return false
        }
        
        switch powerUp {
        case .darkVortex:
            let radius = gameScene.size.width / 3
            let powerUpEntity = DarkVortexPowerUpEntity(
                gameEngine: self,
                at: position,
                with: .init(width: radius, height: radius)
            )
            decreasePlayerMana(by: manaPointsRequired)
            add(powerUpEntity)
        case .hellfire:
            print("Not Implemented Yet")
        case .icePrison:
            print("Not Implemented Yet")
        }
        
        // did activate
        return true
    }
}

extension GameEngine: DroppedManaResponder {
    /**
     Handler function called whenever the `DroppedManaNode` is tapped
     as part of conformance to the `DroppedManaResponder` protocol.
     - Note: This function removes the Mana from screen, and increments
     the player's mana points.
     */
    func droppedManaTapped(droppedManaNode: DroppedManaNode) {
        guard let droppedManaEntity = droppedManaNode.droppedManaEntity,
            let manaPoints = systemDelegate.getMana(for: droppedManaEntity) else {
            return
        }
        
        increasePlayerMana(by: manaPoints)
        removeDelegate?.removeDroppedMana(droppedManaEntity)
    }
}
