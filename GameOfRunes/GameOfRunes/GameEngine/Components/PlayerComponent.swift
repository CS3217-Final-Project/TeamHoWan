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
    
    init(healthNode: HealthBarNode, manaNode: ManaBarNode) {
        super.init()
        self.healthNode = healthNode
        self.manaNode = manaNode
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
