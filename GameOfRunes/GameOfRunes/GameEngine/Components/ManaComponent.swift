//
//  ManaComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class ManaComponent: GKComponent, Component {
    var manaPoints: Int
    var type: ComponentType {
        .manaComponent
    }

    init(manaPoints: Int = 0) {
        self.manaPoints = manaPoints
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
