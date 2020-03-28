//
//  TimerSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 16/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class LabelSystem: GKComponentSystem<LabelComponent>, System {
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        super.init(componentClass: LabelComponent.self)
    }
    
    func setLabel(entity: Entity, label: String) {
        guard let labelComponent = entity.component(ofType: LabelComponent.self) else {
            return
        }
        labelComponent.label = label
    }

    func decreaseLabelOpacity(_ entity: Entity) {
        guard let labelComponent = entity.component(ofType: LabelComponent.self) else {
            return
        }
        labelComponent.decreaseOpacity()
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? LabelComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
