//
//  StageNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StageNode: ButtonNode {
    var stage: Stage
    var selected: Bool {
        didSet {
            guard oldValue != selected else {
                return
            }
            
            texture = .init(imageNamed: "stage-node-\(stage.category)\(selected ? "-selected" : "")")
        }
    }
    
    init(stage: Stage, mapSize: CGSize) {
        self.stage = stage
        selected = false
        
        let mapHalfWidth = mapSize.width / 2
        let mapHalfHeight = mapSize.height / 2
        
        let nodeWidth = mapHalfWidth / 20
        let nodeSize = CGSize(width: nodeWidth, height: nodeWidth)
        
        let nodeImage = SKTexture(imageNamed: "stage-node-\(stage.category)")
        
        let positionRatio = stage.relativePositionRatioInMap
        let nodePosition = CGPoint(x: mapHalfWidth * positionRatio.x, y: mapHalfHeight * positionRatio.y)
        
        super.init(size: nodeSize, texture: nodeImage, buttonType: .stageNode, position: nodePosition)
    }
}
