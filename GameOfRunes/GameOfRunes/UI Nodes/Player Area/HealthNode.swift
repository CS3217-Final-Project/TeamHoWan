//
//  HealthNode.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class HealthNode: SKSpriteNode {
    private static let activeImage = SKTexture(imageNamed: "heart")
    private static let inactiveImage = SKTexture(imageNamed: "heart-empty")
    var active: Bool {
        didSet {
            guard oldValue != active else {
                return
            }
            texture = active ? Self.activeImage : Self.inactiveImage
        }
    }
    
    init(active: Bool = true) {
        self.active = active
        let texture = active ? Self.activeImage : Self.inactiveImage
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
