//
//  StackedLabelsNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StackedLabelsNode: SKSpriteNode {
    let topLabelNode = SKLabelNode(fontNamed: GameConfig.fontName)
    let bottomLabelNode = SKLabelNode(fontNamed: GameConfig.fontName)
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutTopLabelNode()
            layoutBottomLabelNode()
        }
    }
    
    init(backgroundTexture: SKTexture? = nil) {
        super.init(texture: backgroundTexture, color: .clear, size: backgroundTexture?.size() ?? .zero)
        
        topLabelNode.fontColor = .init(hex: "#fefb9e", alpha: 1.0)
        bottomLabelNode.fontColor = .init(hex: "#fefb9e", alpha: 1.0)
        
        addChild(topLabelNode)
        addChild(bottomLabelNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutTopLabelNode() {
        topLabelNode.position = .init(x: 0.0, y: size.height / 6)
        topLabelNode.fontSize = size.height / 4
        topLabelNode.zPosition = 1
    }
    
    private func layoutBottomLabelNode() {
        bottomLabelNode.position = .init(x: 0.0, y: -size.height / 6)
        bottomLabelNode.fontSize = size.height / 4
        bottomLabelNode.zPosition = 1
    }
}
