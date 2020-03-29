//
//  StageOverviewLabelNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StageOverviewLabelNode: SKSpriteNode {
    let nameLabelNode = SKLabelNode(fontNamed: GameConfig.fontName)
    let idLabelNode = SKLabelNode(fontNamed: GameConfig.fontName)
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
        let texture = SKTexture(imageNamed: "stage-label")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        nameLabelNode.fontColor = .black
        nameLabelNode.zPosition = 1
        idLabelNode.fontColor = .black
        idLabelNode.zPosition = 1
        
        addChild(nameLabelNode)
        addChild(idLabelNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutNameLabelNode() {
        nameLabelNode.position = .init(x: 0.0, y: -size.height / 5.5)
        nameLabelNode.fontSize = size.height / 9
    }
    
    private func layoutIdLabelNode() {
        idLabelNode.position = .init(x: 0.0, y: size.height / 10)
        idLabelNode.fontSize = size.height / 11
    }
}
