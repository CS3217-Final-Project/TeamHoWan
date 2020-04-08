//
//  GameEngine.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameEngine: NSObject {
    private weak var systemDelegate: SystemDelegate!
    private weak var removeDelegate: RemoveDelegate!
    weak var contactDelegate: ContactDelegate!
    private weak var spawnDelegate: SpawnDelegate!
    private var entities = [EntityType: Set<Entity>]()
    private var toRemoveEntities = Set<Entity>()
    private var systems = [ComponentType: System]()
    private (set) var metadata: GameMetaData
    weak var gameScene: GameScene?
    // TODO: When timer is up, should retrieve this information from GameMetaData
    private var timeTillNextSpawn: TimeInterval = 0
    
    var playerEntity: PlayerEntity? {
        entities[.playerEntity]?.first as? PlayerEntity
    }
    var comboEntity: ComboEntity? {
        entities[.comboEntity]?.first as? ComboEntity
    }

    var healthSystem: HealthSystem? {
        systems[.healthComponent] as? HealthSystem
    }
    var manaSystem: ManaSystem? {
        systems[.manaComponent] as? ManaSystem
    }
    var moveSystem: MoveSystem? {
        systems[.moveComponent] as? MoveSystem
    }
    var spriteSystem: SpriteSystem? {
        systems[.spriteComponent] as? SpriteSystem
    }
    var scoreSystem: ScoreSystem? {
        systems[.scoreComponent] as? ScoreSystem
    }
    var labelSystem: LabelSystem? {
        systems[.labelComponent] as? LabelSystem
    }
    var timerSystem: TimerSystem? {
        systems[.timerComponent] as? TimerSystem
    }
    var powerUpSystem: PowerUpSystem? {
        systems[.powerUpComponent] as? PowerUpSystem
    }
    var gestureEntitySystem: GestureEntitySystem? {
        systems[.gestureEntityComponent] as? GestureEntitySystem
    }
    var playerSystem: PlayerSystem? {
        systems[.playerComponent] as? PlayerSystem
    }
    
    init(gameScene: GameScene, stage: Stage, avatar: Avatar) {
        metadata = GameMetaData(
            stage: stage,
            avatar: avatar,
            manaPointsPerManaUnit: GameConfig.Mana.manaPerManaUnit
        )

        super.init()
        
        self.gameScene = gameScene

        systemDelegate = self
        removeDelegate = self
        spawnDelegate = self
        contactDelegate = self

        EntityType.allCases.forEach { entityType in
            entities[entityType] = Set()
        }
        
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
    
    func update(with deltaTime: TimeInterval) {
        spawnDelegate.updateSpawn(with: deltaTime)
        systemDelegate.updateSystems(with: deltaTime)
        
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
        
        _ = systemDelegate.minusHealthPoints(for: playerEntity)
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
    
    func unitForceRemoved(_ entity: Entity) {
        guard entity.type == .enemyEntity || entity.type == .playerUnitEntity else {
            return
        }

        removeDelegate.removeUnit(entity, shouldDecreasePlayerHealth: false, shouldIncreaseScore: false)
    }
    
    func unitReachedLine(_ entity: Entity) {
        guard entity.type == .enemyEntity || entity.type == .playerUnitEntity else {
            return
        }
                                          // only remove player health if it is enemyEntity
        removeDelegate.removeUnit(entity, shouldDecreasePlayerHealth: entity.type == .enemyEntity,
                                  shouldIncreaseScore: false)
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
    
    func incrementCombo() {
        if comboEntity == nil {
            add(ComboEntity(gameEngine: self))
        }

        guard let comboEntity = comboEntity else {
            return
        }
        
        systemDelegate.incrementLabelIntegerValue(comboEntity)
        systemDelegate.resetTimer(comboEntity)
    }
    
    func endCombo() {
        guard let comboEntity = comboEntity else {
            return
        }

        remove(comboEntity)
        metadata.multiplier = 1.0
    }
    
    func updateSelectedPowerUp() {
        metadata.selectedPowerUp = gameScene?.selectedPowerUp
        
        switch metadata.selectedPowerUp {
        case .heroicCall:
            // although these power ups do not need position, position is set to center of screen
            // so that that messages will appear at the center if any
            activatePowerUp(at: gameScene?.center
                ?? .init(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY))
        case .divineShield:
            activatePowerUp(at: gameScene?.playerEndPoint.position
                ?? .init(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY))
        case .darkVortex:
            gameScene?.deactivateGestureDetection()
        default:
            // do nth for other power ups or nil
            // ensure gesture detection is activated
            gameScene?.activateGestureDetection()
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
            let manaPoints = droppedManaEntity.component(ofType: ManaComponent.self)?.manaPoints else {
                return
        }
        
        increasePlayerMana(by: manaPoints)
        removeDelegate?.removeDroppedMana(droppedManaEntity)
    }
}

extension GameEngine: ContactDelegate {
    // Contact detected by SpriteKit's physics system
    func didBegin(_ contact: SKPhysicsContact) {
        guard let entityA = contact.bodyA.node?.entity as? Entity,
            let entityB = contact.bodyB.node?.entity as? Entity,
            let entityACollisionType = CollisionType(rawValue: contact.bodyA.categoryBitMask),
            let entityBCollisionType = CollisionType(rawValue: contact.bodyB.categoryBitMask) else {
            return
        }
            
        let sortedOrder = [(entity: entityA, collisionType: entityACollisionType),
                           (entity: entityB, collisionType: entityBCollisionType)]
            .sorted(by: { $0.collisionType < $1.collisionType })
        
        let firstPair = sortedOrder[0]
        let secondPair = sortedOrder[1]
        
        switch firstPair.collisionType {
        case .enemyUnit:
            guard firstPair.entity.type == .enemyEntity else {
                return
            }
            
            switch secondPair.collisionType {
            case .playerUnit:
                guard secondPair.entity.type == .playerUnitEntity else {
                    return
                }
                unitForceRemoved(firstPair.entity)
                unitForceRemoved(secondPair.entity)
            case .playerEndPoint:
                guard secondPair.entity.type == .endPointEntity else {
                    return
                }
                unitReachedLine(firstPair.entity)
            case .powerUp:
                guard let powerUpType = secondPair.entity
                    .component(ofType: PowerUpComponent.self)?
                    .powerUpType else {
                    return
                }
                didActivate(powerUp: powerUpType, on: firstPair.entity)
            default:
                return
            }
        case .playerUnit:
            guard firstPair.entity.type == .playerUnitEntity,
                secondPair.entity.type == .endPointEntity,
                secondPair.collisionType == .enemyEndPoint else {
                return
            }
            unitReachedLine(firstPair.entity)
        default:
            return
        }
    }
        
    private func didActivate(powerUp: PowerUpType, on enemy: Entity) {
        guard enemy.type == .enemyEntity,
            let enemyType = enemy.component(ofType: EnemyTypeComponent.self)?.enemyType,
            !enemyType.isPowerUpImmune else {
                return
        }
        
        switch powerUp {
        case .hellfire:
            unitForceRemoved(enemy)
        case .icePrison:
            changeMovementSpeed(for: enemy, to: enemyType.icePrisonSpeed,
                                duration: GameConfig.IcePrisonPowerUp.powerUpDuration)
        case .divineBlessing:
            setGesture(for: enemy, using: .lightning)
        default:
            return
        }
    }
}

extension GameEngine: RemoveDelegate {
    func removeGesture(for entity: Entity) {
        guard entity.type == .gestureEntity,
            let enemyEntity = entity.component(ofType: ParentEntityComponent.self)?.parent,
            enemyEntity.type == .enemyEntity,
            let enemyHealth = minusHealthPoints(for: enemyEntity) else {
                return
        }
        
        if enemyHealth <= 0 {
            removeUnit(enemyEntity, shouldIncreaseScore: true)
            dropMana(at: enemyEntity)
        } else {
            setGesture(for: enemyEntity)
        }
    }

    func removeUnit(_ entity: Entity, shouldDecreasePlayerHealth: Bool = false,
                    shouldIncreaseScore: Bool = false) {
        guard entity.type == .enemyEntity || entity.type == .playerUnitEntity else {
            return
        }
        
        if shouldDecreasePlayerHealth, entities(for: .divineShieldPowerUpEntity).isEmpty {
            decreasePlayerHealth()
        } else if entity.type == .enemyEntity {
            incrementCombo()
        }
        
        if shouldIncreaseScore, let scoreComponent = entity.component(ofType: ScoreComponent.self) {
            addScore(by: scoreComponent.scorePoints)
        }

        removeUnitFromGameWithAnimation(entity)
    }
    
    func removeDroppedMana(_ entity: Entity) {
        guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else {
            return
        }
        
        let removalAnimation = SKAction.sequence([
            .animate(
                with: TextureContainer.manaRemovalTextures,
                timePerFrame: GameConfig.Unit.removalAnimationTimePerFrame,
                resize: true,
                restore: false
            ),
            .removeFromParent()
        ])
        
        // separate removal animation from entity
        let animationNode = SKSpriteNode()
        animationNode.position = spriteComponent.node.position
        animationNode.run(removalAnimation)
        gameScene?.addNodeToLayer(layer: .removalAnimationLayer, node: animationNode)
        
        remove(entity)
    }
    
    /**
     Removes the `Unit` from the game.
     - Note: This method will first remove the `MoveComponent` to prevent
     the enemy from continuing to move. Then it will run the removal animation.
     Upon completion, the `GameEngine`'s `remove` method is called on
     the `EnemyEntity`.
     */
    private func removeUnitFromGameWithAnimation(_ entity: Entity, fullAnimation: Bool = true) {
        guard entity.type == .enemyEntity || entity.type == .playerUnitEntity,
            let spriteComponent = entity.component(ofType: SpriteComponent.self) else {
                return
        }

        let animationTextures = fullAnimation
            ? TextureContainer.fullEnemyRemovalTextures
            : TextureContainer.halfEnemyRemovalTextures
        
        let removalAnimation = SKAction.sequence([
            .animate(
                with: animationTextures,
                timePerFrame: GameConfig.Unit.removalAnimationTimePerFrame,
                resize: true,
                restore: false
            ),
            .removeFromParent()
        ])
        
        // separate removal animation from entity
        let animationNode = SKSpriteNode()
        animationNode.position = spriteComponent.node.position
        // have to save the value instead of a strong reference to the entity
        let entityType = entity.type
                                            // gives some delay till the game terminates
        animationNode.run(removalAnimation, completion: { [weak self] in
            guard entityType == .enemyEntity else {
                return
            }
            self?.metadata.numEnemiesOnField -= 1
        })
        gameScene?.addNodeToLayer(layer: .removalAnimationLayer, node: animationNode)
        
        // Changing physicsBody to nil is necessary because SpriteComponent and PhysicsBody do not get
        // deinit immediately, leading to >1 contacts detected.
        spriteComponent.node.physicsBody = nil
        remove(entity)
    }
}

extension GameEngine: SystemDelegate {
    func updateSystems(with deltatime: TimeInterval) {
        moveSystem?.update(deltaTime: deltatime)
        playerSystem?.update(deltaTime: deltatime)
        timerSystem?.update(deltaTime: deltatime)
    }
    
    func addComponents(foundIn entity: Entity) {
        systems.values.forEach { system in
            system.addComponent(foundIn: entity)
        }
    }
    
    func removeComponents(foundIn entity: Entity) {
        systems.values.forEach { system in
            system.removeComponent(foundIn: entity)
        }
    }
    
    func removeComponent(_ component: Component) {
        systems[component.type]?.removeComponent(component)
    }

    func minusHealthPoints(for entity: Entity) -> Int? {
        healthSystem?.minusHealthPoints(for: entity)
    }

    func increaseMana(by manaPoint: Int, for entity: Entity) {
        manaSystem?.increaseMana(by: manaPoint, for: entity)
    }
    
    func dropMana(at entity: Entity) {
        manaSystem?.dropMana(at: entity)
    }
    
    func getMana(for entity: Entity) -> Int? {
        manaSystem?.getMana(for: entity)
    }
    
    func changeMovementSpeed(for entity: Entity, to speed: Float, duration: TimeInterval) {
        moveSystem?.changeMovementSpeed(for: entity, to: speed, duration: duration)
    }
    
    func changeAnimationSpeed(for entity: Entity, duration: TimeInterval, to speed: Float, animationNodeKey: String) {
        spriteSystem?.changeAnimationSpeed(for: entity, duration: duration, to: speed,
                                           animationNodeKey: animationNodeKey)
    }
    
    func addScore(by points: Int, multiplier: Double, for entity: Entity) {
        scoreSystem?.addScore(by: points, multiplier: multiplier, for: entity)
    }
    
    func addMultiKillScore(count: Int, for entity: Entity) {
        if count >= 5 {
            addScore(by: GameConfig.Score.pentaKillScore, multiplier: 1, for: entity)
        } else if count >= 3 {
            addScore(by: GameConfig.Score.tripleKillScore, multiplier: 1, for: entity)
        }
    }
    
    func runFadingAnimation(_ entity: Entity) {
        spriteSystem?.runFadingAnimation(entity)
    }
    
    func setLabel(_ entity: Entity, label: String) {
        labelSystem?.setLabel(entity: entity, label: label)
    }
    
    func decreaseLabelOpacity(_ entity: Entity) {
        labelSystem?.decreaseLabelOpacity(entity)
    }
    
    func incrementLabelIntegerValue(_ entity: Entity) {
        labelSystem?.incrementLabelIntegerValue(entity)
    }
    
    func resetTimer(_ entity: Entity) {
        timerSystem?.resetTimer(entity)
    }
    
    func incrementMultiplier(_ entity: Entity) {
        guard entity.type == .comboEntity else {
            return
        }

        scoreSystem?.incrementMultiplier(for: entity)
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
        
        powerUpSystem?.activatePowerUp(at: position, with: size)
        decreasePlayerMana(by: manaPointsRequired)
        gameScene?.deselectPowerUp()
    }
    
    private func checkIfPowerUpIsDisabled(_ powerUp: PowerUpType) -> Bool {
        let disabledPowerUps = entities(for: .enemyEntity).reduce(Set<PowerUpType>(), { result, entity in
            result.union(entity.component(ofType: EnemyTypeComponent.self)?.enemyType.disablePowerUps ?? [])
        })
        
        return disabledPowerUps.contains(powerUp)
    }
    
    func setInitialGesture(for entity: Entity) {
        gestureEntitySystem?.setInitialGesture(for: entity)
    }
    
    func setGesture(for entity: Entity, using gesture: CustomGesture? = nil) {
        gestureEntitySystem?.setGesture(for: entity, using: gesture)
    }
    
    func activateInvincibleEndPoint() {
        guard let entity = entities(for: .endPointEntity).first(where: {
            $0.component(ofType: TeamComponent.self)?.team == .player
        }) else {
            return
        }
        
        spriteSystem?.activateInvincibleEndPoint(for: entity)
    }
    
    func deactivateInvincibleEndPoint() {
        guard let entity = entities(for: .endPointEntity).first(where: {
            $0.component(ofType: TeamComponent.self)?.team == .player
        }) else {
            return
        }
        
        spriteSystem?.deactivateInvincibleEndPoint(for: entity)
    }
}

extension GameEngine: SpawnDelegate {
    func updateSpawn(with deltaTime: TimeInterval) {
        // Send next spawn wave when timer is up
        if timeTillNextSpawn <= 0 {
            startNextSpawnWave()
        } else {
            timeTillNextSpawn -= deltaTime
        }
    }

    func startNextSpawnWave() {
        // Check that there are still waves left
        guard !metadata.stageWaves.isEmpty else {
            return
        }

        let enemySpawnWave = metadata.stageWaves.removeFirstSpawnWave()
        spawnEnemyWave(enemySpawnWave)
        timeTillNextSpawn = metadata.levelSpawnInterval
    }
    
    func spawnPlayerUnitWave() {
        (0..<GameConfig.GamePlayScene.numLanes).forEach { laneIndex in
            spawnPlayerUnit(at: laneIndex)
        }
    }

    private func spawnPlayerUnit(at laneIndex: Int) {
        let playerUnitEntity = PlayerUnitEntity(gameEngine: self)
        
        guard let spriteComponent = playerUnitEntity.component(ofType: SpriteComponent.self),
            let playerEndPoint = gameScene?.playerEndPoint else {
                return
        }
        
        spriteComponent.node.position = GameConfig.GamePlayScene.calculateHorizontallyDistributedPoints(
            width: playerEndPoint.size.width,
            laneIndex: laneIndex,
            totalPoints: GameConfig.GamePlayScene.numLanes,
            yPosition: playerEndPoint.position.y
        )

        add(playerUnitEntity)
    }

    private func spawnEnemyWave(_ enemyWave: [EnemyType?]) {
        enemyWave.enumerated().forEach { laneIndex, enemyType in
            spawnEnemy(at: laneIndex, enemyType: enemyType)
        }
    }

    /**
     Creates the `EnemyEntity` at the correct spawn location (determined by the
     `laneIndex` and adds it to `GameEngine`.
     */
    private func spawnEnemy(at laneIndex: Int, enemyType: EnemyType?) {
        // No need to spawn enemy if enemyType is nil (i.e. lane is empty)
        guard let enemyType = enemyType else {
            return
        }

        let enemyEntity = EnemyEntity(enemyType: enemyType, gameEngine: self)
        guard let spriteComponent = enemyEntity.component(ofType: SpriteComponent.self),
            let sceneSize = gameScene?.size else {
                return
        }

        spriteComponent.node.position = GameConfig.GamePlayScene.calculateHorizontallyDistributedPoints(
            width: sceneSize.width,
            laneIndex: laneIndex,
            totalPoints: GameConfig.GamePlayScene.numLanes,
            yPosition: sceneSize.height - GameConfig.GamePlayScene.verticalOffSet
        )

        add(enemyEntity)
        metadata.numEnemiesOnField += 1
    }
}

