//
//  SpriteComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class SpriteComponent: GKComponent {
    let node: SKSpriteNode
    let heightToWidthRatio: CGFloat
    
    init(texture: SKTexture) {
        let size = texture.size()
        node = SKSpriteNode(texture: texture, size: size)
        heightToWidthRatio = size.height / size.width
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
