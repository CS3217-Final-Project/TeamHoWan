//
//  ManaSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//


import GameplayKit

class ManaSystem: GKComponentSystem<ManaComponent>, System {
    override init() {
        super.init(componentClass: ManaComponent.self)
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        for component in components {
            updateComponent(component)
        }
    }
    
    private func updateComponent(_ component: ManaComponent) {
        if CACurrentMediaTime() - component.lastUpdateMana >= 1.0 {
            component.lastUpdateMana = CACurrentMediaTime()
            component.manaPoints += 1
        }
    }
}
