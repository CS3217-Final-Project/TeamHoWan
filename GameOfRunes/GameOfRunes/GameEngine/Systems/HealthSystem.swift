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
    
    func minusHealthPoints(for entity: Entity) -> Int? {
        guard let entityHealthComponent = entity.component(ofType: HealthComponent.self) else {
            return nil
        }

        entityHealthComponent.healthPoints = max(0, entityHealthComponent.healthPoints - 1)
        return entityHealthComponent.healthPoints
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? HealthComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
