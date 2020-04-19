//
//  AvatarLabelNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class AvatarLabelNode: SKSpriteNode {
    private let labelNode = SKLabelNode(fontNamed: GameConfig.fontName)
    var displayedValue: String {
        get {
            labelNode.text ?? ""
        }
        set {
            labelNode.text = newValue
        }
    }
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutLabelNode()
        }
    }
    
    init() {
        let texture = SKTexture(imageNamed: "name-label")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        labelNode.fontColor = .black
        labelNode.zPosition = 1
        
        addChild(labelNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutLabelNode() {
        labelNode.position = .init(x: 0.0, y: -size.height / 12)
        labelNode.fontSize = size.height / 4.5
    }
}
