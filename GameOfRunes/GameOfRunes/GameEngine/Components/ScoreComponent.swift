//
//  ScoreComponent.swift
//  GameOfRunes
//
//  Created by Andy on 25/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class ScoreComponent: GKComponent, Component {
    var type: ComponentType {
        .scoreComponent
    }
    var scorePoints: Int
    
    init(scorePoints: Int) {
        self.scorePoints = max(0, scorePoints)
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
