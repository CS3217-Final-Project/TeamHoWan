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
    private var storedManaPoints: Int
    var manaPoints: Int {
        get {
            storedManaPoints
        }
        
        set {
            storedManaPoints = max(0, newValue)
        }
    }
    var lastUpdateMana: TimeInterval = 0.0

    init(manaPoints: Int) {
        self.storedManaPoints = max(0, manaPoints)
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
