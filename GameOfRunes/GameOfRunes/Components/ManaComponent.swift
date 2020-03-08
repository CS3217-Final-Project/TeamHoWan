//
//  ManaComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class ManaComponent: GKComponent {
    var manaPoints: Int
    private var lastUpdateMana: TimeInterval = 0.0
    
    init(manaPoints: Int) {
        self.manaPoints = max(0, manaPoints)
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        if CACurrentMediaTime() - lastUpdateMana > 0.5 {
            lastUpdateMana = CACurrentMediaTime()
            manaPoints += 1
        }
    }
}
