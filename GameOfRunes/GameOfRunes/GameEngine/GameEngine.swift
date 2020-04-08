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
    private (set) var contactDelegate: ContactDelegate!
    private var spawnDelegate: SpawnDelegate!
    private var entities = [EntityType: Set<Entity>]()
    private var toRemoveEntities = Set<Entity>()
    private (set) var metadata: GameMetaData
    
    private (set) weak var gameScene: GameScene?
    
    var sceneWidth: CGFloat {
        gameScene?.size.width ?? CGFloat.zero
    }
    var sceneHeight: CGFloat {
        gameScene?.size.height ?? CGFloat.zero
    }
    
    var playerEntity: PlayerEntity? {
        entities[.playerEntity]?.first as? PlayerEntity
    }
    var comboEntity: ComboEntity? {
        entities[.comboEntity]?.first as? ComboEntity
    }
    
    init(gameScene: GameScene, stage: Stage, avatar: Avatar) {
        self.gameScene = gameScene
        metadata = GameMetaData(
            stage: stage,
            avatar: avatar,
            manaPointsPerManaUnit: GameConfig.Mana.manaPerManaUnit
        )
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
            metadata.stageWaves.isEmpty {
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
            let res = entities(for: .enemyEntity)
                .union(entities(for: .attractionEntity).filter({
                    $0.component(ofType: TeamComponent.self)?.team == .enemy
                }))
            return Array(res)
        case .player:
            let res = entities(for: .playerUnitEntity)
                .union(entities(for: .attractionEntity).filter({
                    $0.component(ofType: TeamComponent.self)?.team == .player
                }))
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
            guard let gestureComponent = entity.component(ofType: GestureComponent.self),
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
    
    func setInitialGesture(for entity: Entity) {
        systemDelegate.setInitialGesture(for: entity) 
    }
        
    func setNextGesture(for entity: Entity, using gesture: CustomGesture? = nil) {
        systemDelegate.setGesture(for: entity, using: gesture)
    }
    
    func minusHealthPoints(for entity: Entity) -> Int? {
        systemDelegate.minusHealthPoints(for: entity)
    }
    
    func unitForceRemoved(_ entity: Entity) {
        guard entity.type == .enemyEntity || entity.type == .playerUnitEntity else {
            return
        }

        removeDelegate.removeUnit(entity)
    }
    
    func unitReachedLine(_ entity: Entity) {
        guard entity.type == .enemyEntity || entity.type == .playerUnitEntity else {
            return
        }
                                          // only remove player health if it is enemyEntity
        removeDelegate.removeUnit(entity, shouldDecreasePlayerHealth: entity.type == .enemyEntity)
    }
    
    func dropMana(at entity: Entity) {
        systemDelegate.dropMana(at: entity)
    }
    
    func changeAnimationSpeed(for entity: Entity, duration: TimeInterval, to speed: Float, animationNodeKey: String) {
        systemDelegate.changeAnimationSpeed(for: entity, duration: duration, to: speed,
                                            animationNodeKey: animationNodeKey)
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
    
    func changeMovementSpeed(for enemyEntity: Entity, to speed: Float, duration: TimeInterval) {
        systemDelegate.changeMovementSpeed(
            for: enemyEntity,
            to: speed,
            duration: duration
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
    
    func incrementCombo() {
        if comboEntity == nil {
            add(ComboEntity(gameEngine: self))
        }
        guard let comboEntity = comboEntity else {
            return
        }
        systemDelegate.incrementCombo(comboEntity)
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
        metadata.multiplier = 1.0
    }
    
    func updateSelectedPowerUp(powerUp: PowerUpType?) {
        metadata.selectedPowerUp = powerUp
        
        switch metadata.selectedPowerUp {
        case .heroicCall:
            // although these power ups do not need position, position is set to center of screen
            // so that that messages will appear at the center if any
            activatePowerUp(at: gameScene?.center
                ?? .init(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY))
        case .divineShield:
            activatePowerUp(at: gameScene?.endpointPosition
                ?? .init(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY))
        case .darkVortex:
            gameScene?.deactivateGestureDetection()
        default:
            // do nth for other power ups or nil
            // ensure gesture detection is activated
            gameScene?.activateGestureDetection()
        }
    }

    private func checkIfPowerUpIsDisabled(_ powerUp: PowerUpType) -> Bool {
        let disabledPowerUps = entities(for: .enemyEntity).reduce(Set<PowerUpType>(), { result, entity in
            result.union(entity.component(ofType: EnemyTypeComponent.self)?.enemyType.disablePowerUps ?? [])
        })
        
        return disabledPowerUps.contains(powerUp)
    }
    
    func activatePowerUp(at position: CGPoint, with size: CGSize? = nil) {
        guard let selectedPowerUp = metadata.selectedPowerUp else {
            gameScene?.deselectPowerUp()
            return
        }
        
        if checkIfPowerUpIsDisabled(selectedPowerUp) {
            gameScene?.showPowerUpDisabled(at: position)
            gameScene?.deselectPowerUp()
            return
        }
        
        let manaPointsRequired = selectedPowerUp.manaUnitCost * metadata.manaPointsPerManaUnit

        guard metadata.playerMana >= manaPointsRequired else {
            gameScene?.showInsufficientMana(at: position)
            gameScene?.deselectPowerUp()
            return
        }
        
        systemDelegate.activatePowerUp(at: position, with: size)
        decreasePlayerMana(by: manaPointsRequired)
        gameScene?.deselectPowerUp()
    }
    
    func spawnPlayerUnitWave() {
        spawnDelegate.spawnPlayerUnitWave()
    }
    
    func activateInvincibleEndPoint() {
        guard let entity = entities(for: .endPointEntity).first(where: {
            $0.component(ofType: TeamComponent.self)?.team == .player
        }) else {
            return
        }

        systemDelegate.activateInvincibleEndPoint(for: entity)
    }
    
    func deactivateInvincibleEndPoint() {
        guard let entity = entities(for: .endPointEntity).first(where: {
            $0.component(ofType: TeamComponent.self)?.team == .player
        }) else {
            return
        }
        
        systemDelegate.deactivateInvincibleEndPoint(for: entity)
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
            let manaPoints = droppedManaEntity.component(ofType: ManaComponent.self)?.manaPoints else {
                return
        }
        
        increasePlayerMana(by: manaPoints)
        removeDelegate?.removeDroppedMana(droppedManaEntity)
    }
}
