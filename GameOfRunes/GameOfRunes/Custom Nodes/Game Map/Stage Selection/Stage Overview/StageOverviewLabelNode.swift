//
//  StageOverviewLabelNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StageOverviewLabelNode: StackedLabelsNode {
    var stageName: String {
        get {
            bottomLabelNode.text ?? ""
        }
        set {
            bottomLabelNode.text = newValue
        }
    }
    var stageChapter: String {
        get {
            topLabelNode.text ?? ""
        }
        set {
            topLabelNode.text = newValue
        }
    }
    
    init() {
        super.init(backgroundTexture: .init(imageNamed: "stacked-labels"))
        
        topLabelNode.fontColor = .black
        bottomLabelNode.fontColor = .black
        
        layoutTopLabelNode = {
            self.topLabelNode.position = .init(x: 0.0, y: self.size.height / 10)
            self.topLabelNode.fontSize = self.size.height / 10
        }
        
        layoutBottomLabelNode = {
            self.bottomLabelNode.position = .init(x: 0.0, y: -self.size.height / 5.5)
            self.bottomLabelNode.fontSize = self.size.height / 8
        }
    }
}
