//
//  ScoreComponent.swift
//  GameOfRunes
//
//  Created by Andy on 25/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class EnemyScoreComponent: GKComponent, Component {
    var type: ComponentType {
        .scoreComponent
    }
    
    private var _scorePoints: Int
    
    var scorePoints: Int {
        get {
            self._scorePoints
        }
        set {
            self._scorePoints = newValue
        }
    }
    
    init(scorePoints: Int) {
        self._scorePoints = max(0, scorePoints)
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
