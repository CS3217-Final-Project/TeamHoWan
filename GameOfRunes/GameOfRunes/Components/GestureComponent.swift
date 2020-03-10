//
//  GestureComponent.swift
//  GameOfRunes
//
//  Created by Andy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GestureComponent: GKComponent {
    private var gesture: PathModel
    let node: GestureNode
    
    init(gesture: PathModel) {
        self.gesture = gesture
        self.node = GestureNode(gesture: gesture)
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
