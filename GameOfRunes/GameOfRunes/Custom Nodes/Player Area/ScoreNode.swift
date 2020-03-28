//
//  ScoreNode.swift
//  GameOfRunes
//
//  Created by Andy on 27/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

// SCORENODE FRONTEND TAG FOR JEREMY
class ScoreNode: SKSpriteNode {
    init() {
        super.init(texture: nil, color: .clear, size: .init(width: 100, height: 100))
        buildCoinNode()
        buildLabelNode()
    }
    
    func buildCoinNode() {
        let coinNode = SKSpriteNode(imageNamed: "coins")
        coinNode.size = coinNode.size.scaleTo(height: coinNode.size.height * 0.15)
        coinNode.zPosition = 1
        
        addChild(coinNode)
    }
    
    func buildLabelNode() {
        let scoreLabelNode = SKLabelNode(fontNamed: "DragonFire")
        scoreLabelNode.position = CGPoint()
        scoreLabelNode.name = "label"
        scoreLabelNode.fontSize = 50
        scoreLabelNode.fontColor = SKColor.yellow
        scoreLabelNode.zPosition = 2
        scoreLabelNode.horizontalAlignmentMode = .center
        scoreLabelNode.verticalAlignmentMode = .center
        scoreLabelNode.text = "0"
        scoreLabelNode.position = .init(x: size.width / 2, y: 0)
        
        addChild(scoreLabelNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
