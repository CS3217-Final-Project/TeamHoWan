//
//  MultiplierComponent.swift
//  GameOfRunes
//
//  Created by Andy on 25/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class MultiplierComponent: GKComponent, Component {
    var type: ComponentType {
        .multiplierComponent
    }
    private weak var gameEngine: GameEngine?
    var multiplier: Double {
        get {
            gameEngine?.metadata.multiplier ?? 1
        }
        set {
            gameEngine?.metadata.multiplier = max(1, newValue)
        }
    }
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
