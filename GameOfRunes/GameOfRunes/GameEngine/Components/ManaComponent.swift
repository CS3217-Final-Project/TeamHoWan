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
    private weak var manaBarNode: ManaBarNode?
    private var _manaPoints: Int
    // if manaBarNode exists, use values from there, else use from _manaPoints
    var manaPoints: Int {
        get {
            manaBarNode?.currentManaPoints ?? _manaPoints
        }
        set {
            if let manaBarNode = manaBarNode {
                manaBarNode.currentManaPoints = newValue
                _manaPoints = manaBarNode.currentManaPoints
            } else {
                _manaPoints = max(0, newValue)
            }
        }
    }
    var type: ComponentType {
        .manaComponent
    }

    init(manaPoints: Int, manaBarNode: ManaBarNode? = nil) {
        _manaPoints = max(0, manaPoints)
        manaBarNode?.currentManaPoints = manaPoints
        self.manaBarNode = manaBarNode
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
