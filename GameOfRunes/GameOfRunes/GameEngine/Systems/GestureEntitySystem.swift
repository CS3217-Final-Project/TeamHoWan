//
//  GestureEntitySystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class GestureEntitySystem: GKComponentSystem<GestureEntityComponent>, System {
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        super.init(componentClass: GestureEntityComponent.self)
    }
    
    override func addComponent(foundIn entity: GKEntity) {
        guard let gestureEntityComponent = entity.component(ofType: GestureEntityComponent.self) else {
            return
        }
        
        gameEngine?.add(gestureEntityComponent.gestureEntity)
    }
    
    override func removeComponent(foundIn entity: GKEntity) {
        guard let gestureEntityComponent = entity.component(ofType: GestureEntityComponent.self) else {
            return
        }
        
        gameEngine?.remove(gestureEntityComponent.gestureEntity)
    }
    
    func setInitialGesture(for entity: Entity) {
        guard entity.type == .enemyEntity,
            let enemyNode = entity.component(ofType: SpriteComponent.self)?.node as? SKSpriteNode,
            let gesture = generateGesture(for: entity) else {
                return
        }

        let gestureEntity = GestureEntity(gesture: gesture, parent: entity)
        gestureEntity.component(ofType: SpriteComponent.self)?
            .setGestureConstraint(referenceNode: enemyNode)
        let gestureEntityComponent = GestureEntityComponent(gestureEntity)
        entity.addComponent(gestureEntityComponent)
    }
    
    func setGesture(for entity: Entity, using gesture: CustomGesture?) {
        guard entity.type == .enemyEntity,
            let enemyNode = entity.component(ofType: SpriteComponent.self)?.node as? SKSpriteNode else {
                return
        }
        
        var nextGesture = gesture
        
        if nextGesture == nil {
            nextGesture = generateGesture(for: entity)
        }
        
        guard let newGesture = nextGesture else {
            return
        }

        if let currentGestureEntity = entity.component(ofType: GestureEntityComponent.self)?.gestureEntity {
            entity.removeComponent(ofType: GestureEntityComponent.self)
            gameEngine?.remove(currentGestureEntity)
        }
        
        let gestureEntity = GestureEntity(gesture: newGesture, parent: entity)
        gestureEntity.component(ofType: SpriteComponent.self)?
            .setGestureConstraint(referenceNode: enemyNode)
        let gestureEntityComponent = GestureEntityComponent(gestureEntity)
        entity.addComponent(gestureEntityComponent)
        gameEngine?.add(gestureEntity)
    }
    
    private func generateGesture(for entity: Entity) -> CustomGesture? {
        guard let enemyType = entity.component(ofType: EnemyTypeComponent.self)?.enemyType else {
            return nil
        }
        
        var availableGestures = enemyType.gesturesAvailable
        
        if let currentGesture = entity.component(ofType: GestureEntityComponent.self)?
            .gestureEntity.component(ofType: GestureComponent.self)?.gesture {
                availableGestures.removeAll { $0 == currentGesture }
        }
        
        return availableGestures.randomElement()
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? GestureEntityComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
