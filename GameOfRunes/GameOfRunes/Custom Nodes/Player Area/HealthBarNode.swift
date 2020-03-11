//
//  HealthBarNode.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class HealthBarNode: SKSpriteNode {
    private static let spacingBetweenHealthNodes: CGFloat = 10.0
    var totalLives: Int
    var livesLeft: Int
    private var healthNodes = [HealthNode]()
    override var size: CGSize {
        didSet {
            let numHealthNodes = healthNodes.count
            guard numHealthNodes > 0 else {
                return
            }
            
            let newHealthNodeSize = healthNodes[0].size.scaleTo(height: size.height * 0.65)
            healthNodes.forEach { $0.size = newHealthNodeSize }
            
            let newHealthNodeWidth = newHealthNodeSize.width
            let intervalVector = CGVector(
                dx: newHealthNodeWidth + Self.spacingBetweenHealthNodes,
                dy: 0.0
            )
            let numIntervalsPerSide = (numHealthNodes - 1) / 2
            var healthNodePosition = position
                + .init(numIntervalsPerSide) * -intervalVector
                + .init(dx: numHealthNodes.isMultiple(of: 2) ? -newHealthNodeWidth / 2 : 0.0, dy: 0.0)
            
            healthNodes.forEach {
                $0.position = healthNodePosition
                healthNodePosition += intervalVector
            }
        }
    }
    
    init(totalLives: Int = 3) {
        self.totalLives = max(1, totalLives)
        livesLeft = self.totalLives
        let texture = SKTexture(imageNamed: "health-container")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        for _ in 0..<self.totalLives {
            let healthNode = HealthNode()
            healthNode.zPosition = 1
            healthNodes.append(healthNode)
            addChild(healthNode)
        }
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
