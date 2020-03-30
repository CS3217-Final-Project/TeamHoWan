//
//  PlayerComponent.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 27/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class PlayerComponent: GKComponent, Component {
    var type: ComponentType {
        .playerComponent
    }
    weak var healthNode: HealthBarNode?
    weak var manaNode: ManaBarNode?
    weak var scoreNode: ScoreNode?
    
    init(healthNode: HealthBarNode, manaNode: ManaBarNode, scoreNode: ScoreNode) {
        super.init()
        self.healthNode = healthNode
        self.manaNode = manaNode
        self.scoreNode = scoreNode
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
