//
//  GestureNode.swift
//  GameOfRunes
//
//  Created by Andy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class GestureNode: SKSpriteNode {
    init(gesture: CustomGesture) {
        super.init(texture: nil, color: .clear, size: .zero)
        let texture = gesture.getTexture()
        size = texture.size()
        self.texture = texture
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
