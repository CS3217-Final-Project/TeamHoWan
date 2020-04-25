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
        
        layoutTopLabelNode = {
            self.topLabelNode.position = .init(x: 0.0, y: 0.0)
            self.topLabelNode.fontSize = self.size.width / 16
        }
        
        layoutBottomLabelNode = {
            self.bottomLabelNode.position = .init(x: 0.0, y: -self.size.height / 4)
            self.bottomLabelNode.fontSize = self.size.width / 16
        }
    }
    
    func layoutTitleLabelNode() {
        titleLabelNode.position = .init(x: 0.0, y: size.height / 4)
        titleLabelNode.fontSize = size.width / 12
    }
}
