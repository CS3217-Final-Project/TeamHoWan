//
//  DescriptionNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class DescriptionNode: StackedLabelsNode {
    let titleLabelNode = SKLabelNode(fontNamed: GameConfig.fontName)
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            
            layoutTitleLabelNode()
        }
    }
    
    init() {
        super.init()
        titleLabelNode.fontColor = .init(hex: "#fefb9e", alpha: 1.0)
        titleLabelNode.zPosition = 1
        
        addChild(titleLabelNode)
    }
    
    func layoutTitleLabelNode() {
        titleLabelNode.position = .init(x: 0.0, y: size.height / 4)
        titleLabelNode.fontSize = size.width / 12
    }
    
    override func layoutTopLabelNode() {
        topLabelNode.position = .init(x: 0.0, y: 0.0)
        topLabelNode.fontSize = size.width / 16
    }
    
    override func layoutBottomLabelNode() {
        bottomLabelNode.position = .init(x: 0.0, y: -size.height / 4)
        bottomLabelNode.fontSize = size.width / 16
    }
}
