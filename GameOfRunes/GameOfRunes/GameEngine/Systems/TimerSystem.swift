//
//  TimerSystem.swift
//  GameOfRunes
//
//  Created by Andy on 27/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class TimerSystem: GKComponentSystem<TimerComponent>, System {
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        super.init(componentClass: TimerComponent.self)
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        for component in components {
            component.timeLeft -= seconds
            if component.timeLeft <= 0 {
                updateComponent(component)
            }
        }
    }
    
    func updateComponent(_ component: TimerComponent) {
        guard let entity = component.entity as? Entity else {
            return
        }
        if var powerUpEntity = entity as? PowerUpEntity {
            if !powerUpEntity.fading {
                component.timeLeft = powerUpEntity.powerUpType.getFadeOutDuration
                powerUpEntity.fading = true
                gameEngine?.runFadingAnimation(entity)
            } else {
                gameEngine?.remove(entity)
            }
        }
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? TimerComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
