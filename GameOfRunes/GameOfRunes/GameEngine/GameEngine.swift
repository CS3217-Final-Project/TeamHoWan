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
    
    init(scene: SKScene) {
        self.scene = scene
        self.systemManager = SystemManager(gameEngine: self)
        self.removeDelegate = RemoveDelegate(gameEngine: self)
    }
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene?.addChild(spriteNode)
        }
        
        systemManager.addComponents(foundIn: entity)
    }
    
    func remove(_ entity: GKEntity) {
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        
        entities.remove(entity)
        toRemoveEntities.insert(entity)
    }
    
    func update(with deltaTime: TimeInterval) {
        systemManager.update(with: deltaTime)
        toRemoveEntities.forEach { entity in
            systemManager.removeComponents(foundIn: entity)
        }
        toRemoveEntities.removeAll()
    }
    
    func spawnEnemy() {        
        let enemyEntity = EnemyEntity(enemyType: .orc2, gameEngine: self)
        if let spriteComponent = enemyEntity.component(ofType: SpriteComponent.self),
            let sceneSize = scene?.size {
            spriteComponent.node.position = .init(
                x: .random(in: sceneSize.width * 0.25 ... sceneSize.width * 0.75),
                y: sceneSize.height - 100
            )
            let newSpriteWidth = sceneSize.width / 6
            let newSpriteHeight = spriteComponent.heightToWidthRatio * newSpriteWidth
            spriteComponent.node.size = .init(width: newSpriteWidth, height: newSpriteHeight)
        }
        add(enemyEntity)
    }
    
    func entities(for team: Team) -> [GKEntity] {
        entities.compactMap { $0.component(ofType: TeamComponent.self)?.team == team ? $0 : nil }
    }
    
    func moveComponents(for team: Team) -> [MoveComponent] {
        let entitiesToMove = entities(for: team)
        return entitiesToMove.compactMap { $0.component(ofType: MoveComponent.self) }
    }
    
    func gestureActivated(gesture: CustomGesture) {
        for entity in entities {
            guard let gestureComponent = entity.component(ofType: GestureComponent.self), gestureComponent.gesture != gesture else {
                continue
            }

            removeDelegate.removeGesture(for: entity)
        }
    }
    
    func minusHealthPoints(for entity: GKEntity) -> Int? {
        return systemManager.minusHealthPoints(for: entity)
    }
}
