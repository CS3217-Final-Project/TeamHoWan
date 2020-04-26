//
//  SKSpriteNode+helpers.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

extension SKSpriteNode {
    func addGlow(radius: Float = 30) {
        let effectNode = SKEffectNode()
        effectNode.name = "glow"
        effectNode.shouldRasterize = true
        addChild(effectNode)
        
        // Ensure that Glow is proportionate to current SpriteNode size
        let effectBaseNode = SKSpriteNode(texture: texture)
        effectBaseNode.size = size.applying(.init(scaleX: 1.2, y: 3))
        effectNode.addChild(effectBaseNode)

        effectNode.filter = CIFilter(name: "CIGaussianBlur", parameters: ["inputRadius": radius])
    }
    
    func removeGlow() {
        guard let effectNode = childNode(withName: "glow") else {
            return
        }
        
        effectNode.removeFromParent()
    }
    
    func aspectFillToSize(fillSize: CGSize) {
        guard let texture = texture else {
            return
        }
        
        size = texture.size()
        let verticalRatio = fillSize.height / size.height
        let horizontalRatio = fillSize.width / size.width
        let scaleRatio = horizontalRatio > verticalRatio ? horizontalRatio : verticalRatio
        setScale(scaleRatio)
    }
}
