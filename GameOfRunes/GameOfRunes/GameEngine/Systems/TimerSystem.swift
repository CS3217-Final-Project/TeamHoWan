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
        
        switch entity.type {
        case .icePrisonPowerUpEntity, .hellFirePowerUpEntity, .darkVortexPowerUpEntity:
            if var powerUpEntity = entity as? PowerUpEntity, component.time <= 0 {
                if !powerUpEntity.fading {
                    component.time = powerUpEntity.powerUpType.getFadeOutDuration
                    powerUpEntity.fading = true
                    gameEngine?.runFadingAnimation(entity)
                } else {
                    gameEngine?.remove(entity)
                }
            }
        case .timerEntity:
            let currentTime = component.time
            if Int(currentTime) != Int(currentTime - seconds) {
                gameEngine?.setLabel(entity, label: "\(Int(currentTime))")
            }
        case .comboEntity:
            if let comboEntity = entity as? ComboEntity {
                if component.time <= 0, let labelComponent = comboEntity.component(ofType: LabelComponent.self) {
                    // If timer runs out, remove entity and add combo score
                    gameEngine?.addComboScore(count: Int(labelComponent.label) ?? 0)
                    gameEngine?.endCombo()
                } else {
                    // Decrease opacity of label
                    gameEngine?.decreaseLabelOpacity(entity)
                }
            }
        default:
            return
        }
    }
    
    func resetCombo(_ entity: Entity) {
        guard let timerComponent = entity.component(ofType: TimerComponent.self) else {
            return
        }
        timerComponent.time = GameConfig.Score.comboTimer
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? TimerComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
