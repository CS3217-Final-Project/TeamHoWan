//
//  PlayerScoreComponent.swift
//  GameOfRunes
//
//  Created by Andy on 25/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//


import GameplayKit

class PlayerScoreComponent: GKComponent, Component {
    private let scoreNode: SKLabelNode
    var currentScore: Int = 0 {
        didSet {
            scoreNode.text = "\(currentScore)"
        }
    }
    var type: ComponentType {
        .labelComponent
    }
    
    init(scoreNode: SKLabelNode) {
        self.scoreNode = scoreNode
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

