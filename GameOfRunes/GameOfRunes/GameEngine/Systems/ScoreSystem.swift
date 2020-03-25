//
//  ScoreSystem.swift
//  GameOfRunes
//
//  Created by Andy on 25/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class ScoreSystem: GKComponentSystem<ScoreComponent>, System {
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        super.init(componentClass: MoveComponent.self)
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
