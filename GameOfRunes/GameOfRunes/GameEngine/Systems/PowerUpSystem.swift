//
//  PowerUpSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class PowerUpSystem: GKComponentSystem<PowerUpComponent>, System {
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        super.init(componentClass: PowerUpComponent.self)
    }
    
    override func addComponent(foundIn entity: GKEntity) {
        super.addComponent(foundIn: entity)
        
        guard let powerUpType = entity.component(ofType: PowerUpComponent.self)?.powerUpType else {
            return
        }
        
        if powerUpType == .divineShield {
            gameEngine?.activateInvincibleEndPoint()
        }
    }
    
    override func removeComponent(foundIn entity: GKEntity) {
        super.addComponent(foundIn: entity)
        
        guard let powerUpType = entity.component(ofType: PowerUpComponent.self)?.powerUpType else {
            return
        }
        
        if powerUpType == .divineShield {
            gameEngine?.deactivateInvincibleEndPoint()
        }
    }

    func removeComponent(_ component: Component) {
        guard let component = component as? PowerUpComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
