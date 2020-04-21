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
        super.init(componentClass: ScoreComponent.self)
    }
    
    func incrementMultiplier(for entity: Entity) {
        guard let multiplierComponent = entity.component(ofType: MultiplierComponent.self) else {
            return
        }
        multiplierComponent.multiplier = max(1, multiplierComponent.multiplier + 0.1)
    }
    
    func addScore(by points: Int, multiplier: Double, for entity: Entity) {
        guard let scoreComponent = entity.component(ofType: ScoreComponent.self) else {
            return
        }
    
        scoreComponent.scorePoints = max(scoreComponent.scorePoints + Int(Double(points) * multiplier),
                                         scoreComponent.scorePoints)
    }
    
    func addComponent(_ component: Component) {
        guard let component = component as? ScoreComponent else {
            return
        }
        
        super.addComponent(component)
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
