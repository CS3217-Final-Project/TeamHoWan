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
            layoutNameLabelNode()
            layoutIdLabelNode()
        }
    }
    
    init() {
        nameLabelNode = .init(fontNamed: GameConfig.fontName)
        nameLabelNode.fontColor = .white
        nameLabelNode.zPosition = 1
        
        idLabelNode = .init(fontNamed: GameConfig.fontName)
        idLabelNode.fontColor = .white
        idLabelNode.zPosition = 1
        super.init(texture: nil, color: .clear, size: .zero)
        
        addChild(nameLabelNode)
        addChild(idLabelNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutNameLabelNode() {
        nameLabelNode.position = .init(x: 0.0, y: -size.height / 40)
        nameLabelNode.fontSize = size.height / 4
    }
    
    private func layoutIdLabelNode() {
        idLabelNode.position = .init(x: 0.0, y: -size.height / 3.25)
        idLabelNode.fontSize = size.height / 7
    }
}
