//
//  StagePreviewLabelNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StagePreviewLabelNode: SKSpriteNode {
    let nameLabelNode: SKLabelNode
    let idLabelNode: SKLabelNode
    var category: Stage.Category? {
        didSet {
            guard let category = category, oldValue != category else {
                return
            }
            
            texture = .init(imageNamed: "stage-name-preview-\(category)")
        }
    }
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutLabelNodes()
        }
    }
    
    init() {
        nameLabelNode = .init(fontNamed: GameConfig.fontName)
        nameLabelNode.fontColor = .white
        idLabelNode = .init(fontNamed: GameConfig.fontName)
        idLabelNode.fontColor = .white
        super.init(texture: nil, color: .clear, size: .zero)
        
        addChild(nameLabelNode)
        addChild(idLabelNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutLabelNodes() {
        
    }
}
