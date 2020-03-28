//
//  StagePreviewNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StagePreviewNode: SKSpriteNode {
    private let labelNode: StagePreviewLabelNode
    private let battleNode: StageBattleNode
    var selectedStage: Stage? {
        didSet {
            guard let stage = selectedStage else {
                return
            }
            labelNode.category = stage.category
            labelNode.nameLabelNode.text = stage.name
            labelNode.idLabelNode.text = stage.id
        }
    }
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutLabelNode()
            layoutBattleNode()
        }
    }
    
    init(width: CGFloat, position: CGPoint = .zero) {
        labelNode = .init()
        battleNode = .init()
        let texture = SKTexture(imageNamed: "stage-preview")
        let size = texture.size().scaleTo(width: width)
        super.init(texture: texture, color: .clear, size: size)
        
        isUserInteractionEnabled = true
        self.position = position
        addChild(labelNode)
        addChild(battleNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutLabelNode() {
        labelNode.size = size.applying(.init(scaleX: 0.5, y: 0.55))
        labelNode.position = .zero + .init(dx: -size.width / 10, dy: 0.0)
        labelNode.zPosition = 1
    }
    
    private func layoutBattleNode() {
        battleNode.size = battleNode.size.scaleTo(height: size.height * 0.5)
        battleNode.position = .zero + .init(dx: size.width / 4, dy: 0.0)
        battleNode.zPosition = 1
    }
}
