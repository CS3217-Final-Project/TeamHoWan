//
//  NumberPadButtonNode.swift
//  GameOfRunes
//
//  Created by Jermy on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class NumberPadButtonNode: ButtonNode {
    private let displayLabelNode: SKLabelNode = .init(fontNamed: GameConfig.fontName)
    var displayValue: String {
        get {
            displayLabelNode.text ?? ""
        }
        set {
            displayLabelNode.text = newValue
        }
    }
    var feedbackValue: String
    
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutDisplayLabelNode()
        }
    }
    
    init(backgroundTexture: SKTexture?, feedbackValue: String) {
        self.feedbackValue = feedbackValue
        super.init(
            size: backgroundTexture?.size() ?? .zero,
            texture: backgroundTexture
        )
        
        displayLabelNode.fontColor = .init(hex: "#fefb9e", alpha: 1.0)
        displayLabelNode.zPosition = 1
        
        addChild(displayLabelNode)
    }
    
    private func layoutDisplayLabelNode() {
        displayLabelNode.position = .init(x: 0.0, y: -size.height / 7)
        displayLabelNode.fontSize = size.height / 2.5
    }
}
