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
        case .divineShield:
            let radius = (gameEngine?.gameScene?.size.width ?? UIScreen.main.bounds.width) / 2
            powerUpSize = .init(width: radius, height: radius)
        case .heroicCall:
            gameEngine?.spawnPlayerUnitWave()
        default:
            break
        }
        
        guard let size = powerUpSize,
            let entity = powerUpType.createEntity(at: position, with: size) else {
                return
        }
        
        gameEngine?.add(entity)
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
