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
        effectNode.shouldRasterize = true
        addChild(effectNode)
        effectNode.addChild(SKSpriteNode(texture: texture))
        effectNode.filter = CIFilter(name: "CIGaussianBlur", parameters: ["inputRadius": radius])
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
