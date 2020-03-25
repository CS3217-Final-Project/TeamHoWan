//
//  ScoreSystem.swift
//  GameOfRunes
//
//  Created by Andy on 25/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class ScoreSystem: GKComponentSystem<ScoreComponent>, System {
    override init() {
        super.init(componentClass: MoveComponent.self)
    }
    
    func setMultiplier(multiplier: Int, for entity: GKEntity) {
        guard let multiplierComponent = entity.component(ofType: MultiplierComponent.self) else {
            return
        }
        
        multiplierComponent.multiplier = max(1, multiplier)
    }
    
    func addScore(by points: Int, for entity: GKEntity) {
        guard let scoreComponent = entity.component(ofType: ScoreComponent.self),
            let multiplierComponent = entity.component(ofType: MultiplierComponent.self) else {
            return
        }
        
        let multiplier = multiplierComponent.multiplier
        scoreComponent.scorePoints = max(0, scoreComponent.scorePoints + points * multiplier)
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? ScoreComponent else {
            return
        }
        
        super.removeComponent(component)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
