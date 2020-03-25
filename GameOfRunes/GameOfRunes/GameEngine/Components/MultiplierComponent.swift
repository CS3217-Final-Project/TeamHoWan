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
    
    private var _multipler: Int = 1
    
    var multiplier: Int {
        get {
            self._multipler
        }
        set {
            self._multipler = newValue
        }
    }
    
    override init() {
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
