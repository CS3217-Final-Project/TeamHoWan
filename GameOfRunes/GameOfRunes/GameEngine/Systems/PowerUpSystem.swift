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

    func activatePowerUp(at position: CGPoint, with size: CGSize?) {
        guard let powerUpType = gameEngine?.metadata.selectedPowerUp else {
            return
        }
        
        var powerUpSize = size
        
        switch powerUpType {
        case .darkVortex:
            // abitrary width for dark vortex
            let radius = (gameEngine?.gameScene?.size.width ?? UIScreen.main.bounds.width) / 3
            powerUpSize = .init(width: radius, height: radius)
            fallthrough
        case .hellfire, .icePrison:
            guard let size = powerUpSize else {
                return
            }
            let entity = powerUpType.createEntity(at: position, with: size)
            gameEngine?.add(entity)
        case .heroicCall:
            gameEngine?.spawnPlayerUnitWave()
        default:
            return
        }
    }

    func removeComponent(_ component: Component) {
        guard let component = component as? PowerUpComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
