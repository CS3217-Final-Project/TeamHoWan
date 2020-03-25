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
    
    private var _scorePoints: Int
    private let scoreNode: SKLabelNode?
    
    var scorePoints: Int {
        get {
            self._scorePoints
        }
        set {
            if let scoreNode = self.scoreNode {
                scoreNode.text = "\(newValue)"
            }
            self._scorePoints = newValue
        }
    }
    
    init(scorePoints: Int, scoreNode: SKLabelNode? = nil) {
        self._scorePoints = max(0, scorePoints)
        self.scoreNode = scoreNode
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
