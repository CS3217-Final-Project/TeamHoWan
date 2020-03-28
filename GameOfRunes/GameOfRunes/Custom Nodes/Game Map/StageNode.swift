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
    
    init(stage: Stage, mapSize: CGSize) {
        self.stage = stage
        
        let mapHalfWidth = mapSize.width / 2
        let mapHalfHeight = mapSize.height / 2
        
        let nodeWidth = mapHalfWidth / 20
        let nodeSize = CGSize(width: nodeWidth, height: nodeWidth)
        
        let nodeImage = SKTexture(imageNamed: "stage-node-\(stage.category)")
        
        let positionRatio = stage.relativePositionRatioInMap
        let nodePosition = CGPoint(x: mapHalfWidth * positionRatio.x, y: mapHalfHeight * positionRatio.y)
        
        super.init(size: nodeSize, texture: nodeImage, buttonType: .stageNode, position: nodePosition)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        texture = .init(imageNamed: "stage-node-\(stage.category)-selected")
    }
}
