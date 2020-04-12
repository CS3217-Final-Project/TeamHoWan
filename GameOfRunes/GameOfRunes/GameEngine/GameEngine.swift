//
//  GameEngine.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameEngine: GameEngineFacade {
    private lazy var removeDelegate: RemoveDelegate = .init(gameEngine: self)
    private(set) lazy var contactDelegate: ContactDelegate = .init(gameEngine: self)
    private lazy var spawnDelegate: SpawnDelegate = .init(gameEngine: self)
    private var entities = [EntityType: Set<Entity>]()
    private(set) var systems = [ComponentType: System]()
    private var toRemoveEntities = Set<Entity>()
    private(set) weak var gameScene: GameSceneFacade?
    let metadata: GameMetaData
    
    var playerEntity: PlayerEntity? {
        entities[.playerEntity]?.first as? PlayerEntity
    }
    var comboEntity: ComboEntity? {
        entities[.comboEntity]?.first as? ComboEntity
    }
    
    var isDivineShieldActivated: Bool {
        entities(for: .powerUpEntity).contains(where: { $0 is DivineShieldPowerUpEntity })
    }
    
    init(gameScene: GameSceneFacade, stage: Stage, avatar: Avatar) {
        self.gameScene = gameScene
        self.metadata = GameMetaData(
            stage: stage,
            avatar: avatar,
            manaPointsPerManaUnit: GameConfig.Mana.manaPerManaUnit
        )
        
        EntityType.allCases.forEach { entityType in
            entities[entityType] = Set()
        }
        
        systems = {
            var systems = [ComponentType: System]()
            
            systems[.healthComponent] = HealthSystem()
            systems[.scoreComponent] = ScoreSystem()
            systems[.manaComponent] = ManaSystem(gameEngine: self)
            systems[.moveComponent] = MoveSystem(gameEngine: self)
            systems[.spriteComponent] = SpriteSystem(gameEngine: self)
            systems[.labelComponent] = LabelSystem(gameEngine: self)
            systems[.playerComponent] = PlayerSystem(gameEngine: self)
            systems[.timerComponent] = TimerSystem(gameEngine: self)
            systems[.powerUpComponent] = PowerUpSystem(gameEngine: self)
            systems[.attractionEntitiesComponent] = AttractionEntitiesSystem(gameEngine: self)
            systems[.gestureEntityComponent] = GestureEntitySystem(gameEngine: self)
            
            return systems
        }()
    }
    
    func add(_ entity: Entity) {
        guard entities[entity.type]?.insert(entity).inserted == true else {
            return
        }
        
        addComponents(foundIn: entity)
    }
    
    func addPlayerEntity(healthNode: HealthBarNode, manaNode: ManaBarNode, scoreNode: ScoreNode) {
        add(PlayerEntity(
            gameEngine: self,
            healthNode: healthNode,
            manaNode: manaNode,
            scoreNode: scoreNode
        ))
    }
    
    func addTimerEntity(timerNode: SKLabelNode, initialTimerValue: TimeInterval) {
        add(TimerEntity(gameEngine: self, timerNode: timerNode, initialTimerValue: initialTimerValue))
    }
    
    func addEndPointEntity(node: SKSpriteNode, team: Team) {
        add(EndPointEntity(node: node, team: team))
    }
    
    func remove(_ entity: Entity) {
        guard entities[entity.type]?.remove(entity) != nil else {
            return
        }
        
        toRemoveEntities.insert(entity)
    }
    
    func update(with deltaTime: TimeInterval) {
        spawnDelegate.update(with: deltaTime)
        updateSystems(with: deltaTime)
        
        toRemoveEntities.forEach { entity in
            removeComponents(foundIn: entity)
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
        
        addScore(by: points, multiplier: metadata.multiplier, for: playerEntity)
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
        
        addMultiKillScore(count: count, for: playerEntity)
    }
    
    func unitForceRemoved(_ entity: Entity) {
        guard entity.type == .enemyEntity || entity.type == .playerUnitEntity else {
            return
        }
        
        removeDelegate.removeUnit(
            entity,
            shouldDecreasePlayerHealth: false,
            shouldIncreaseScore: true,
            fullAnimation: true
        )
    }
    
    func unitReachedLine(_ entity: Entity) {
        guard entity.type == .enemyEntity || entity.type == .playerUnitEntity else {
            return
        }
        
        removeDelegate.removeUnit(
            entity,
            // only remove player health if it is enemyEntity
            shouldDecreasePlayerHealth: entity.type == .enemyEntity,
            shouldIncreaseScore: false,
            fullAnimation: true
        )
    }
    
    func increasePlayerMana(by manaPoints: Int) {
        guard let playerEntity = playerEntity else {
            return
        }
        
        increaseMana(by: manaPoints, for: playerEntity)
    }
    
    func decreasePlayerMana(by manaPoints: Int) {
        increasePlayerMana(by: -manaPoints)
    }
    
    func incrementCombo() {
        if comboEntity == nil {
            add(ComboEntity(gameEngine: self))
        }
        
        guard let comboEntity = comboEntity else {
            return
        }
        
        incrementCombo(comboEntity)
    }
    
    func incrementMultiplier() {
        guard let comboEntity = comboEntity else {
            return
        }
        
        incrementMultiplier(comboEntity)
    }
    
    func endCombo() {
        guard let comboEntity = comboEntity else {
            return
        }
        
        remove(comboEntity)
        metadata.multiplier = 1.0
    }
    
    func updateSelectedPowerUp(powerUpType: PowerUpType?) {
        metadata.selectedPowerUp = powerUpType
        
        guard let selectedPowerUp = metadata.selectedPowerUp else {
            gameScene?.activateGestureDetection()
            return
        }
        if selectedPowerUp.powerUp is ImmediatelyActivatedPowerUp {
            activatePowerUp(at: gameScene?.center ?? .init(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY))
        } else {
            selectedPowerUp.powerUp.prepareForActivation(gameEngine: self)
        }
    }
    
    private func checkIfPowerUpIsDisabled(_ powerUp: PowerUpType) -> Bool {
        let disabledPowerUps = entities(for: .enemy).reduce(Set<PowerUpType>(), { result, entity in
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
        
        let manaPointsRequired = selectedPowerUp.powerUp.manaUnitCost * metadata.manaPointsPerManaUnit
        
        guard metadata.playerMana >= manaPointsRequired else {
            gameScene?.showInsufficientMana(at: position)
            gameScene?.deselectPowerUp()
            return
        }
        
        selectedPowerUp.powerUp.activate(at: position, with: size, gameEngine: self)
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
        
        activateInvincibleEndPoint(for: entity)
    }
    
    func deactivateInvincibleEndPoint() {
        guard let entity = entities(for: .endPointEntity).first(where: {
            $0.component(ofType: TeamComponent.self)?.team == .player
        }) else {
            return
        }
        
        deactivateInvincibleEndPoint(for: entity)
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
        removeDelegate.removeDroppedMana(droppedManaEntity)
    }
}
