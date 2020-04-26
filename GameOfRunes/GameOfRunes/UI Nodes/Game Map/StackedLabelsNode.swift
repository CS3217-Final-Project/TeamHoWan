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
    
    lazy var layoutTopLabelNode: () -> Void = {
        self.topLabelNode.position = .init(x: 0.0, y: self.size.height / 6)
        self.topLabelNode.fontSize = self.size.height / 4
    }
    
    lazy var layoutBottomLabelNode: () -> Void = {
        self.bottomLabelNode.position = .init(x: 0.0, y: -self.size.height / 6)
        self.bottomLabelNode.fontSize = self.size.height / 4
    }
    
    init(backgroundTexture: SKTexture? = nil) {
        super.init(texture: backgroundTexture, color: .clear, size: backgroundTexture?.size() ?? .zero)
        
        topLabelNode.fontColor = .init(hex: "#fefb9e", alpha: 1.0)
        bottomLabelNode.fontColor = .init(hex: "#fefb9e", alpha: 1.0)
        
        topLabelNode.zPosition = 1
        bottomLabelNode.zPosition = 1
        
        addChild(topLabelNode)
        addChild(bottomLabelNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
