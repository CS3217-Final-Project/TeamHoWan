//
//  EntityManager.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class EntityManager {
    lazy var componentSystems: [GKComponentSystem] = {
        let manaSystem = GKComponentSystem(componentClass: ManaComponent.self)
        return [manaSystem]
    }()
    var entities = Set<GKEntity>()
    var toRemoveEntities = Set<GKEntity>()
    weak var scene: SKScene?
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene?.addChild(spriteNode)
        }
        
        componentSystems.forEach { $0.addComponent(foundIn: entity) }
    }
    
    func remove(_ entity: GKEntity) {
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        
        entities.remove(entity)
        toRemoveEntities.insert(entity)
    }
    
    func update(with deltaTime: CFTimeInterval) {
        componentSystems.forEach { $0.update(deltaTime: deltaTime) }
        toRemoveEntities.forEach { entity in
            componentSystems.forEach { componentSystem in
                componentSystem.removeComponent(foundIn: entity)
            }
        }
        toRemoveEntities = []
    }
    
    func spawnEnemy() {
        guard let manaComponent = entities
            .compactMap({ $0.component(ofType: ManaComponent.self) })
            .first, manaComponent.manaPoints >= 10 else {
                return
        }
        
        manaComponent.manaPoints -= 10
        let enemyEntity = EnemyEntity(enemyType: .orc2)
        if let spriteComponent = enemyEntity.component(ofType: SpriteComponent.self),
            let sceneSize = scene?.size {
            spriteComponent.node.position = .init(
                x: .random(in: sceneSize.width * 0.25 ... sceneSize.width * 0.75),
                y: 150)
            let newSpriteWidth = sceneSize.width / 6
            let newSpriteHeight = spriteComponent.heightToWidthRatio * newSpriteWidth
            spriteComponent.node.size = .init(width: newSpriteWidth, height: newSpriteHeight)
        }
        add(enemyEntity)
    }
}
