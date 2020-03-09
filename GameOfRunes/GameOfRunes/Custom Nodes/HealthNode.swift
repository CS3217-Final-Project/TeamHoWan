//
//  HealthNode.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class HealthNode: SKSpriteNode {
    var active: Bool {
        didSet {
            texture = getTexture(active: active)
        }
    }
    
    init(size: CGSize, active: Bool=true) {
        self.active = active
        super.init(texture: nil, color: .clear, size: size)
        
        texture = getTexture(active: active)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getTexture(active: Bool) -> SKTexture {
        .init(imageNamed: active ? "heart" : "heart-empty")
    }
}
