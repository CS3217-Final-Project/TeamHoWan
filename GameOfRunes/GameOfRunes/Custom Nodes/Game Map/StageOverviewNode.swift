//
//  StageOverviewNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StageOverviewNode: SKSpriteNode {
    private let stageLabelNode = StageOverviewLabelNode()
    var selectedStage: Stage? {
        didSet {
            guard let stage = selectedStage else {
                return
            }
            
            stageLabelNode.nameLabelNode.text = stage.name
            stageLabelNode.idLabelNode.text = stage.id
        }
    }
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutStageLabelNode()
        }
    }
    
    init(size: CGSize) {
        super.init(texture: nil, color: .cyan, size: size)
        
        addChild(stageLabelNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutStageLabelNode() {
        stageLabelNode.size = stageLabelNode.size.scaleTo(width: size.width * 1.2)
        stageLabelNode.position = .zero + .init(dx: 0.0, dy: (size.height - stageLabelNode.size.height) / 2)
        stageLabelNode.zPosition = 1
    }
}
