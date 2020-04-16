//
//  NumberPadLabelNode.swift
//  GameOfRunes
//
//  Created by Jermy on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class NumberPadLabelNode: StackedLabelsNode {
    var header: String {
        get {
            topLabelNode.text ?? ""
        }
        set {
            topLabelNode.text = newValue
        }
    }
    var displayedValue: String {
        get {
            bottomLabelNode.text ?? ""
        }
        set {
            bottomLabelNode.text = newValue
        }
    }
    
    init() {
        super.init(backgroundTexture: .init(imageNamed: "stacked-labels"))
        
        topLabelNode.fontColor = .black
        bottomLabelNode.fontColor = .black
    }
    
    override func layoutTopLabelNode() {
        topLabelNode.position = .init(x: 0.0, y: size.height / 12)
        topLabelNode.fontSize = size.height / 6
    }
    
    override func layoutBottomLabelNode() {
        bottomLabelNode.position = .init(x: 0.0, y: -size.height / 4.5)
        bottomLabelNode.fontSize = size.height / 4.5
    }
}
