//
//  HealthComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class HealthComponent: GKComponent, Component {
    private weak var healthBarNode: HealthBarNode?
    private var _healthPoints: Int
    // if healthBarNode exists, use values from there, else use from _healthPoints
    var healthPoints: Int {
        get {
            healthBarNode?.livesLeft ?? _healthPoints
        }
        set {
            if let healthBarNode = healthBarNode {
                healthBarNode.livesLeft = newValue
                _healthPoints = healthBarNode.livesLeft
            } else {
                _healthPoints = max(0, newValue)
            }
        }
    }
    var type: ComponentType {
        .healthComponent
    }
    
    init(healthPoints: Int, healthBarNode: HealthBarNode? = nil) {
        _healthPoints = max(0, healthPoints)
        healthBarNode?.livesLeft = healthPoints
        self.healthBarNode = healthBarNode
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
