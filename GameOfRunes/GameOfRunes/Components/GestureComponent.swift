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
//    private var gestureSprite: SKSpriteNode
    
    init(gesture: PathModel) {
        self.gesture = gesture
//        self.gestureSprite = gesture.getTexture()
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
