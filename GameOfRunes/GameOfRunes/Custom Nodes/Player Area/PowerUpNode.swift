//
//  PowerUpNode.swift
//  GameOfRunes
//
//  Created by Jermy on 13/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class PowerUpNode: SKSpriteNode {
    var powerUpType: PowerUpType
    
    init(powerUpType: PowerUpType) {
        self.powerUpType = powerUpType
        super.init(texture: nil, color: .clear, size: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
