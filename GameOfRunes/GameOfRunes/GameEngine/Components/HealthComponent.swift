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
    var healthPoints: Int
    var type: ComponentType {
        return .healthComponent
    }
    
    init(healthPoints: Int) {
        self.healthPoints = max(0, healthPoints)
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
