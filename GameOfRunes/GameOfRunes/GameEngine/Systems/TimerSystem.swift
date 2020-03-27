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
            if component.isCountDown {
                component.time -= seconds
            } else {
                component.time += seconds
            }

            updateComponent(component, seconds)
        }
    }
    
    func updateComponent(_ component: TimerComponent, _ seconds: TimeInterval) {
        guard let entity = component.entity as? Entity else {
            return
        }
        if component.time <= 0, var powerUpEntity = entity as? PowerUpEntity {
            if !powerUpEntity.fading {
                component.time = powerUpEntity.powerUpType.getFadeOutDuration
                powerUpEntity.fading = true
                gameEngine?.runFadingAnimation(entity)
            } else {
                gameEngine?.remove(entity)
            }
            return
        }
        if entity is TimerEntity {
            let currentTime = component.time
            if Int(currentTime) != Int(currentTime - seconds) {
                gameEngine?.setLabel(entity, label: "\(Int(currentTime))")
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
