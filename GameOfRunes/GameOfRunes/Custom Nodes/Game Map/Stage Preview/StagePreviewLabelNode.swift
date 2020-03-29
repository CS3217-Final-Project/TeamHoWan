//
//  StagePreviewLabelNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StagePreviewLabelNode: SKSpriteNode {
    private let nameLabelNode = SKLabelNode(fontNamed: GameConfig.fontName)
    private let groupNameLabelNode = SKLabelNode(fontNamed: GameConfig.fontName)
    var stageName: String {
        get {
            nameLabelNode.text ?? ""
        }
        set {
            nameLabelNode.text = newValue
        }
    }
    var stageGroupName: String {
        get {
            groupNameLabelNode.text ?? ""
        }
        set {
            groupNameLabelNode.text = newValue
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
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutNameLabelNode()
            layoutGroupLabelNode()
        }
    }
    
    init() {
        super.init(texture: nil, color: .clear, size: .zero)
        
        nameLabelNode.fontColor = .white
        nameLabelNode.zPosition = 1
        groupNameLabelNode.fontColor = .white
        groupNameLabelNode.zPosition = 1
        
        addChild(nameLabelNode)
        addChild(groupNameLabelNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutNameLabelNode() {
        nameLabelNode.position = .init(x: 0.0, y: -size.height / 40)
        nameLabelNode.fontSize = size.height / 4
    }
    
    private func layoutGroupLabelNode() {
        groupNameLabelNode.position = .init(x: 0.0, y: -size.height / 3.25)
        groupNameLabelNode.fontSize = size.height / 7
    }
}
