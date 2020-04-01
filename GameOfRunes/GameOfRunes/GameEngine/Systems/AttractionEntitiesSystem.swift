//
//  AttractionEntitiesSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class AttractionEntitiesSystem: GKComponentSystem<AttractionEntitiesComponent>, System {
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        super.init(componentClass: AttractionEntitiesComponent.self)
    }
    
    override func addComponent(foundIn entity: GKEntity) {
        guard let attractionEntitiesComponent = entity.component(ofType: AttractionEntitiesComponent.self) else {
            return
        }
        
        for entity in attractionEntitiesComponent.attractionEntities {
            gameEngine?.add(entity)
        }
    }
    
    override func removeComponent(foundIn entity: GKEntity) {
        guard let attractionEntitiesComponent = entity.component(ofType: AttractionEntitiesComponent.self) else {
            return
        }
        
        for entity in attractionEntitiesComponent.attractionEntities {
            gameEngine?.remove(entity)
        }
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? AttractionEntitiesComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
