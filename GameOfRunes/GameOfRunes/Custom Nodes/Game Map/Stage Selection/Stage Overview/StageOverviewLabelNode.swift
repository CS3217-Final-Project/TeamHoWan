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
        super.init(backgroundTexture: .init(imageNamed: "stage-label"))
        
        topLabelNode.fontColor = .black
        bottomLabelNode.fontColor = .black
    }
    
    override func layoutTopLabelNode() {
        topLabelNode.position = .init(x: 0.0, y: size.height / 10)
        topLabelNode.fontSize = size.height / 10
    }
    
    override func layoutBottomLabelNode() {
        bottomLabelNode.position = .init(x: 0.0, y: -size.height / 5.5)
        bottomLabelNode.fontSize = size.height / 8
    }
}
