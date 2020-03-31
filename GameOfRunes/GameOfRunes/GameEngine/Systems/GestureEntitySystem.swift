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
    
    func removeComponent(_ component: Component) {
        guard let component = component as? GestureEntityComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
