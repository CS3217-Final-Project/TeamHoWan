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
        components.forEach { component in
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
        switch entity.type {
        case .powerUpEntity:
            guard component.time <= 0,
                let powerUpComponent = entity.component(ofType: PowerUpComponent.self) else {
                    return
            }
            
            if !powerUpComponent.fading {
                component.time = 0.25
                powerUpComponent.fading = true
                gameEngine?.runFadingAnimation(entity)
            } else {
                gameEngine?.remove(entity)
            }
        case .timerEntity:
            let currentTime = component.time
            if Int(currentTime) != Int(currentTime - seconds) {
                gameEngine?.setLabel(entity, label: "\(Int(currentTime))")
            }
        case .comboEntity:
            if component.time <= 0 {
                // If timer runs out, end combo and reset multiplier
                gameEngine?.endCombo()
            } else {
                // Decrease opacity of label
                gameEngine?.decreaseLabelOpacity(entity)
            }
        default:
            return
        }
    }
    
    func resetTimer(_ entity: Entity) {
        guard let timerComponent = entity.component(ofType: TimerComponent.self) else {
            return
        }

        timerComponent.time = timerComponent.initialTimerValue
    }
    
    func addComponent(_ component: Component) {
        guard let component = component as? TimerComponent else {
            return
        }
        
        super.addComponent(component)
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? TimerComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
