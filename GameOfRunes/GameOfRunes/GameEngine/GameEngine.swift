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
    var droppedManaResponder: DroppedManaResponder? {
        systemDelegate.droppedManaResponder
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

        toRemoveEntities.removeAll()
        
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

    func activatePowerUp(powerUp: PowerUpType, at location: CGPoint,
                         with size: CGSize, manaPointsRequired: Int, circle: CircleResult? = nil) {
        guard let selectedPowerUp = gameScene?.playerAreaNode.powerUpContainerNode.selectedPowerUp else {
            return
        }

//        let loc = CGPoint(x: location.x, y: gestureAreaNode.size.height - location.y)
        
        let manaPointsRequired = selectedPowerUp.manaUnitCost * playerAreaNode.manaBarNode.manaPointsPerUnit
        let currentManaPoints = playerAreaNode.manaBarNode.currentManaPoints
        playerAreaNode.powerUpContainerNode.selectedPowerUp = nil

        guard currentManaPoints >= manaPointsRequired else {
            // do up the animation for insufficient mana
            let insufficientManaLabel = SKLabelNode(fontNamed: GameConfig.fontName)
            insufficientManaLabel.position = loc
            insufficientManaLabel.text = "Insufficient Mana"
            insufficientManaLabel.fontSize = size.width / 25
            insufficientManaLabel.fontColor = .green
            let animationAction = SKAction.sequence([
                .move(by: .init(dx: 0.0, dy: size.width / 100), duration: 1.5),
                .fadeOut(withDuration: 0.25),
                .removeFromParent()
            ])

            insufficientManaLabel.run(animationAction)
            gameScene?.highestPriorityLayer.addChild(insufficientManaLabel)
            return
        }
        
        switch powerUp {
        case .darkVortex:
            let powerUpEntity = DarkVortexPowerUpEntity(gameEngine: self,
                                                        at: location,
                                                        with: size)
            decreasePlayerMana(by: manaPointsRequired)
            add(powerUpEntity)
        case .hellfire:
            print("Not Implemented Yet")
        case .icePrison:
            print("Not Implemented Yet")
        }
    }
}
