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
    var contactDelegate: ContactDelegate!
    private var spawnDelegate: SpawnDelegate!
    private var entities = [EntityType: Set<Entity>]()
    private var toRemoveEntities = Set<Entity>()
    private (set) var metadata: GameMetaData
    weak var gameScene: GameScene?
    
    var playerEntity: PlayerEntity? {
        entities[.playerEntity]?.first as? PlayerEntity
    }
    var comboEntity: ComboEntity? {
        entities[.comboEntity]?.first as? ComboEntity
    }
    
    // TODO: pass in avatar, and use it to determine powerups.
    init(gameScene: GameScene, stage: Stage) {
        self.gameScene = gameScene
        metadata = GameMetaData(maxPlayerHealth: GameConfig.Health.maxPlayerHealth,
                                numManaUnits: GameConfig.Mana.numManaUnits,
                                manaPerManaUnit: GameConfig.Mana.manaPerManaUnit,
                                powerUps: [.darkVortex, .hellfire, .icePrison],
                                stage: stage)
        systemDelegate = SystemDelegate(gameEngine: self)
        removeDelegate = RemoveDelegate(gameEngine: self)
        spawnDelegate = SpawnDelegate(gameEngine: self,
                                      gameMetaData: metadata)
        contactDelegate = ContactDelegate(gameEngine: self)

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
        spawnDelegate.update(with: deltaTime)
        systemDelegate.update(with: deltaTime)
        
        toRemoveEntities.forEach { entity in
            systemDelegate.removeComponents(foundIn: entity)
        }
        
        toRemoveEntities = []
        
        // Player Loses the Game
        if metadata.playerHealth <= 0 {
            gameScene?.gameDidEnd(didWin: false, finalScore: metadata.score)
        }

        // Player Wins the Game
        if (metadata.playerHealth > 0) &&
            (metadata.numEnemiesOnField == 0) &&
            metadata.levelWaves.isEmpty {
            gameScene?.gameDidEnd(didWin: true, finalScore: metadata.score)
        }
    }

    /** Will start the next Spawn Wave. Function called when Summon button is presesd. */
    func startNextSpawnWave() {
        spawnDelegate.startNextSpawnWave()
    }
    
    /** Gets all entities of a particular `Team`. */
    func entities(for team: Team) -> [Entity] {
        switch team {
        case .enemy:
            return Array(entities[.enemyEntity] ?? Set())
        case .player:
            let res = entities(for: .endPointEntity)
                .union(entities(for: .darkVortexPowerUpEntity))
                .union(entities(for: .attractionEntity))
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
    
    func addScore(by points: Int) {
        guard let playerEntity = playerEntity else {
            return
        }
        
        systemDelegate.addScore(by: points, multiplier: metadata.multiplier, for: playerEntity)
    }
    
    func gestureActivated(gesture: CustomGesture) {
        var count = 0
        for entity in entities(for: .gestureEntity) {
            guard let gestureComponent =
                entity.component(ofType: GestureComponent.self),
                gestureComponent.gesture == gesture else {
                    continue
            }
            removeDelegate.removeGesture(for: entity)
            count += 1
            
        }
        guard let playerEntity = playerEntity else {
            return
        }
        
        systemDelegate.addMultiKillScore(count: count, for: playerEntity)
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
    
    func stopMovement(for enemyEntity: Entity, duration: TimeInterval) {
        systemDelegate.stopMovement(
            for: enemyEntity,
            duration: GameConfig.IcePrisonPowerUp.powerUpDuration
        )
    }
    
    func runFadingAnimation(_ entity: Entity) {
        systemDelegate.runFadingAnimation(entity)
    }
    
    func setLabel(_ entity: Entity, label: String) {
        systemDelegate.setLabel(entity, label: label)
    }
    
    func decreaseLabelOpacity(_ entity: Entity) {
        systemDelegate.decreaseLabelOpacity(entity)
    }
    
    func incrementLabelIntegerValue(_ entity: Entity) {
        systemDelegate.incrementLabelIntegerValue(entity)
    }
    
    func incrementCombo() {
        if comboEntity == nil {
            add(ComboEntity(gameEngine: self))
        }
        guard let comboEntity = comboEntity else {
            return
        }
        incrementLabelIntegerValue(comboEntity)
    }
    
    func incrementMultiplier() {
        guard let comboEntity = comboEntity else {
            return
        }
        systemDelegate.incrementMultiplier(comboEntity)
    }
    
    func endCombo() {
        guard let comboEntity = comboEntity else {
            return
        }
        remove(comboEntity)
    }
}

/** Extension to the GameEngine for PowerUps */
extension GameEngine {
    func didActivatePowerUp(at position: CGPoint, with size: CGSize) -> Bool {
        // must only be called when a power up is selected
        guard let gameScene = gameScene,
            let selectedPowerUp = gameScene.selectedPowerUp else {
                fatalError("Game Engine didActivatePowerUp must only be called when a power up is selected")
        }
        
        let manaPointsRequired = selectedPowerUp.manaUnitCost * metadata.manaPerManaUnit
        gameScene.deselectPowerUp()
        
        guard metadata.playerMana >= manaPointsRequired else {
            // did not activate
            return false
        }
        
        let powerUpEntity = selectedPowerUp.createPowerUpEntity(at: position, with: size)
        add(powerUpEntity)
        decreasePlayerMana(by: manaPointsRequired)
        
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
