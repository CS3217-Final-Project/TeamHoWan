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
    
    init(size: CGSize = .zero, position: CGPoint = .zero) {
        labelNode = .init()
        battleNode = .init()
        super.init(texture: .init(imageNamed: "stage-preview"), color: .clear, size: size)
        
        self.position = position
        addChild(labelNode)
        addChild(battleNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
