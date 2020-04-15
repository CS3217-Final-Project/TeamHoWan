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
        
        layoutTopLabelNode = {
            self.topLabelNode.position = .init(x: 0.0, y: self.size.height / 12)
            self.topLabelNode.fontSize = self.size.height / 6
        }
        
        layoutBottomLabelNode = {
            self.bottomLabelNode.position = .init(x: 0.0, y: -self.size.height / 4.5)
            self.bottomLabelNode.fontSize = self.size.height / 4.5
        }
    }
}
