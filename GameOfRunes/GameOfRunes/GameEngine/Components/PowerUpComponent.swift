//
//  PowerUpComponent.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class PowerUpComponent: GKComponent, Component {
    var type: ComponentType {
        .powerUpComponent
    }
    let powerUpType: PowerUpType
    
    init(_ powerUpType: PowerUpType) {
        self.powerUpType = powerUpType
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
