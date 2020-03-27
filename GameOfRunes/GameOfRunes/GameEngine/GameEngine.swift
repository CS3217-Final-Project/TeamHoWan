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
    private (set) var metadata: GameMetaData
    weak var gameScene: GameScene?
    var playerEntity: PlayerEntity? {
        entities[.playerEntity]?.first as? PlayerEntity
    }

    // TODO: pass in avatar, and use it to determine powerups.
    init(gameScene: GameScene) {
        self.gameScene = gameScene
        metadata = GameMetaData(maxPlayerHealth: GameConfig.Health.maxPlayerHealth,
                                numManaUnits: GameConfig.Mana.numManaUnits,
                                manaPerManaUnit: GameConfig.Mana.manaPerManaUnit,
                                powerUps: [.darkVortex, .hellfire, .icePrison])
        systemDelegate = SystemDelegate(gameEngine: self)
        removeDelegate = RemoveDelegate(gameEngine: self)

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
        if metadata.playerHealth <= 0 {
            gameScene?.gameDidEnd(didWin: false)
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
            let res = entities(for: .endPointEntity)
                .union(entities(for: .darkVortexPowerUpEntity))
            return Array(res)
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
        guard let playerEntity = playerEntity else {
            return
        }
        
        _ = minusHealthPoints(for: playerEntity)
    }
    
    func gestureActivated(gesture: CustomGesture) {
        for entity in entities(for: .gestureEntity) {
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
    
    func enemyForceRemoved(_ entity: GKEntity) {
        guard let enemyEntity = entity as? EnemyEntity else {
            return
        }
        removeDelegate.removeEnemy(enemyEntity)
    }
    
    func enemyReachedLine(_ entity: GKEntity) {
        guard let enemyEntity = entity as? EnemyEntity else {
            return
        }
        removeDelegate.removeEnemy(enemyEntity, shouldDecreasePlayerHealth: true)
    }
    
    func dropMana(at entity: GKEntity) {
        systemDelegate.dropMana(at: entity)
    }
    
    func stopAnimationForDuration(for entity: Entity, duration: TimeInterval, animationNodeKey: String) {
        systemDelegate.stopAnimation(for: entity, duration: duration, animationNodeKey: animationNodeKey)
    }
    
    func increasePlayerMana(by manaPoints: Int) {
        guard let playerEntity = playerEntity else {
            return
        }
        
        systemDelegate.increaseMana(by: manaPoints, for: playerEntity)
    }
    
    func decreasePlayerMana(by manaPoints: Int) {
        increasePlayerMana(by: -manaPoints)
    }
    
    func runFadingAnimation(_ entity: Entity) {
        systemDelegate.runFadingAnimation(entity)
    }
    
    func setLabel(_ entity: Entity, label: String) {
        systemDelegate?.setLabel(entity, label: label)
    }
}

/** Extension to the GameEngine for PowerUps */
extension GameEngine {
    func didActivatePowerUp(at position: CGPoint, size: CGFloat? = nil) -> Bool {
        // must only be called when a power up is selected
        guard let gameScene = gameScene,
            let selectedPowerUp = gameScene.selectedPowerUp else {
                fatalError("Invalid call to didActivatePowerUp")
        }
        
        let manaPointsRequired = selectedPowerUp.manaUnitCost * metadata.manaPerManaUnit
        gameScene.deselectPowerUp()
        guard metadata.playerMana >= manaPointsRequired else {
            // did not activate
            return false
        }
        
        var powerUpEntity: Entity
        
        switch selectedPowerUp {
        case .darkVortex:
            let radius = gameScene.size.width / 3
            powerUpEntity = DarkVortexPowerUpEntity(
                gameEngine: self,
                at: position,
                with: .init(width: radius, height: radius)
            )
            add(powerUpEntity)
        case .hellfire:
            powerUpEntity = HellfirePowerUpEntity(
                gameEngine: self,
                at: position,
                with: .init(width: (size ?? 0) * 2, height: (size ?? 0) * 2)
            )
            add(powerUpEntity)
        case .icePrison:
            powerUpEntity = IcePrisonPowerUpEntity(
                gameEngine: self,
                at: position,
                with: .init(width: (size ?? 0) * 2, height: (size ?? 0) * 2)
            )
            add(powerUpEntity)
            activateIcePrison(powerUpEntity)
        }
        
        decreasePlayerMana(by: manaPointsRequired)
        
        // did activate
        return true
    }
    
    private func activateIcePrison(_ entity: Entity) {
        guard let icePrisonPowerUpEntity = entity as? IcePrisonPowerUpEntity,
            let powerUpNode = icePrisonPowerUpEntity.component(ofType: SpriteComponent.self)?.node else {
                return
        }
        
        for enemyEntity in entities(for: .enemy) {
            guard enemyEntity.component(ofType: SpriteComponent.self)?.node
                    .calculateAccumulatedFrame()
                    .intersects(powerUpNode.calculateAccumulatedFrame()) ?? false,
                let enemyEntity = enemyEntity as? EnemyEntity else {
                    continue
            }
            
            systemDelegate.stopMovement(
                for: enemyEntity,
                duration: GameConfig.IcePrisonPowerUp.powerUpDuration
            )
        }
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
