//
//  StagePreviewLabelNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StagePreviewLabelNode: StackedLabelsNode {
    var stageName: String {
        get {
            topLabelNode.text ?? ""
        }
        set {
            topLabelNode.text = newValue
        }
    }
    var stageChapter: String {
        get {
            bottomLabelNode.text ?? ""
        }
        set {
            bottomLabelNode.text = newValue
        }
    }
    var category: Stage.Category? {
        didSet {
            guard let category = category, oldValue != category else {
                return
            }
            
            texture = .init(imageNamed: "stage-name-preview-\(category)")
        }
    }
    
    init() {
        super.init()
        
        topLabelNode.fontColor = .white
        bottomLabelNode.fontColor = .white
        
        layoutTopLabelNode = {
            self.topLabelNode.position = .init(x: 0.0, y: -self.size.height / 40)
            self.topLabelNode.fontSize = self.size.height / 4
        }
        
        layoutBottomLabelNode = {
            self.bottomLabelNode.position = .init(x: 0.0, y: -self.size.height / 3.25)
            self.bottomLabelNode.fontSize = self.size.height / 7
        }
    }
}
