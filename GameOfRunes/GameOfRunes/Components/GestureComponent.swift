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
    let gesture: CustomGesture
    let node: GestureNode
    
    init(gesture: CustomGesture) {
        self.gesture = gesture
        self.node = GestureNode(gesture: gesture)
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
