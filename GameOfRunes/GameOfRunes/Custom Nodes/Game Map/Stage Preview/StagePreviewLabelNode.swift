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
    var stageGroupName: String {
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
    }
    
    override func layoutTopLabelNode() {
        topLabelNode.position = .init(x: 0.0, y: -size.height / 40)
        topLabelNode.fontSize = size.height / 4
    }
    
    override func layoutBottomLabelNode() {
        bottomLabelNode.position = .init(x: 0.0, y: -size.height / 3.25)
        bottomLabelNode.fontSize = size.height / 7
    }
}
