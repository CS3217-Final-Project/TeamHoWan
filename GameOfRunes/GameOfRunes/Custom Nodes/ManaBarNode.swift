//
//  ManaBarNode.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class ManaBarNode: SKSpriteNode {
    let numManaUnits: Int
    let manaPointsPerUnit: Int
    var totalManaPoints: Int {
        numManaUnits * manaPointsPerUnit
    }
    var currentManaPoints: Int
    private var progressBarNode: ProgressBarNode
    override var size: CGSize {
        didSet {
            progressBarNode.size = size.applying(.init(scaleX: 1.0, y: 0.9))
            //progressBarNode.progress = 0.5
        }
    }
    
    init(numManaUnits: Int, manaPointsPerUnit: Int) {
        self.numManaUnits = max(1, numManaUnits)
        self.manaPointsPerUnit = max(1, manaPointsPerUnit)
        currentManaPoints = 0
        let texture = SKTexture(imageNamed: "mana-container")
        progressBarNode = .init(color: .init(hex: "#a8ffff", alpha: 1.0), size: texture.size())
        super.init(texture: texture, color: .clear, size: texture.size())
        
        progressBarNode.position = position
        progressBarNode.zPosition = -1
        addChild(progressBarNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
