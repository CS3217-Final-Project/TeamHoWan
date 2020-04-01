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

    func activatePowerUp(at position: CGPoint, with size: CGSize) {
        guard let gameEngine = gameEngine,
            let powerUpType = gameEngine.metadata.selectedPowerUp else {
                return
        }
        
        let entity = powerUpType.createEntity(at: position, with: size)
        gameEngine.add(entity)
    }

    func removeComponent(_ component: Component) {
        guard let component = component as? PowerUpComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
