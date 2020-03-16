//
//  TimerSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 16/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class TimerSystem: GKComponentSystem<TimerComponent>, System {
    override init() {
        super.init(componentClass: TimerComponent.self)
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        for component in components {
            updateComponent(component)
        }
    }
    
    private func updateComponent(_ component: TimerComponent) {
        if CACurrentMediaTime() - component.lastUpdatedTime >= 1.0 {
            component.lastUpdatedTime = CACurrentMediaTime()
            component.updateTimeOneSecond()
        }
    }
}
