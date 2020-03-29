//
//  MultiplierComponent.swift
//  GameOfRunes
//
//  Created by Andy on 25/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class MultiplierComponent: GKComponent, Component {
    var type: ComponentType {
        .multiplierComponent
    }
    private var metaData: GameMetaData
    var multiplier: Double {
        get {
            metaData.multiplier
        }
        set {
            metaData.multiplier = max(1, newValue)
        }
    }
    
    init(metaData: GameMetaData) {
        self.metaData = metaData
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
