//
//  HealthSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class HealthSystem: GKComponentSystem<HealthComponent>, System {
    override init() {
        super.init(componentClass: HealthComponent.self)
    }
    
    func minusHealthPoints(for entity: GKEntity) -> Int? {
        guard let healthComponent = components.filter({ component in component.entity === entity }).first
            else {
            return nil
        }
        
        healthComponent.healthPoints -= 1
        return healthComponent.healthPoints
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? HealthComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
