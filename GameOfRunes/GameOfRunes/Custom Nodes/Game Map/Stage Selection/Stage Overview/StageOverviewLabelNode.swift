//
//  StageOverviewLabelNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StageOverviewLabelNode: SKSpriteNode {
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
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutNameLabelNode()
            layoutGroupNameLabelNode()
        }
    }
    
    init() {
        let texture = SKTexture(imageNamed: "stage-label")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        nameLabelNode.fontColor = .black
        nameLabelNode.zPosition = 1
        groupNameLabelNode.fontColor = .black
        groupNameLabelNode.zPosition = 1
        
        addChild(nameLabelNode)
        addChild(groupNameLabelNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutNameLabelNode() {
        nameLabelNode.position = .init(x: 0.0, y: -size.height / 5.5)
        nameLabelNode.fontSize = size.height / 9
    }
    
    private func layoutGroupNameLabelNode() {
        groupNameLabelNode.position = .init(x: 0.0, y: size.height / 10)
        groupNameLabelNode.fontSize = size.height / 11
    }
}
