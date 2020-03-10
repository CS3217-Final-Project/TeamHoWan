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
    private var accumulatedManaPoints: Int {
        didSet {
            guard oldValue != accumulatedManaPoints else {
                return
            }
            
            updateManaBar()
            
            let currentBar = accumulatedManaPoints / manaPointsPerUnit
            guard currentBar != lastLitBar else {
                return
            }
            
            lastLitBar = currentBar
            for i in 0..<barDividerNodes.count {
                barDividerNodes[i].active = i < currentBar
            }
        }
    }
    var currentManaPoints: Int {
        get {
            accumulatedManaPoints
        }
        
        set {
            accumulatedManaPoints = max(0, min(newValue, totalManaPoints))
        }
    }
    private var progressBarNode: ProgressBarNode
    override var size: CGSize {
        didSet {
            // position the start of the progress bar to be inline with the window
            progressBarNode.position = position + .init(dx: -size.width * 0.35, dy: 0.5)
            progressBarNode.size.height = size.height * 0.7
            progressBarNode.maxWidth = size.width * 0.7
            updateManaBar()
            
            let numBarDividerNodes = barDividerNodes.count
            guard numBarDividerNodes > 0 else {
                return
            }
            
            // layout bar divider
            let newBarDividerNodeSize = CGSize(width: 3, height: size.height * 0.7)
            barDividerNodes.forEach { $0.size = newBarDividerNodeSize }
            
            let newBarDividerNodeWidth = newBarDividerNodeSize.width
            let spacingBetweenBarDividerNode = (
                size.width * 0.7 - .init(numBarDividerNodes) * newBarDividerNodeWidth
                ) / .init(numManaUnits)
            let intervalVector = CGVector(
                dx: newBarDividerNodeWidth + spacingBetweenBarDividerNode,
                dy: 0.0
            )
            
            var barDividerNodePosition = position
                + .init(dx: -size.width * 0.35, dy: 0.0)
                + .init(dx: spacingBetweenBarDividerNode + newBarDividerNodeWidth / 2, dy: 0.0)
            
            barDividerNodes.forEach {
                $0.position = barDividerNodePosition
                barDividerNodePosition += intervalVector
            }
        }
    }
    private var barDividerNodes = [BarDividerNode]()
    private var lastLitBar = 0
    
    init(numManaUnits: Int, manaPointsPerUnit: Int, initialManaPoints: Int = 0) {
        self.numManaUnits = max(1, numManaUnits)
        self.manaPointsPerUnit = max(1, manaPointsPerUnit)
        accumulatedManaPoints = initialManaPoints
        let texture = SKTexture(imageNamed: "mana-container")
        progressBarNode = .init(color: .init(hex: "#4ce2ff", alpha: 1.0), size: texture.size())
        super.init(texture: texture, color: .clear, size: texture.size())
        
        progressBarNode.zPosition = -2
        addChild(progressBarNode)
        
        for _ in 0..<self.numManaUnits - 1 {
            let barDividerNode = BarDividerNode(color: .gray, glowColor: .white)
            barDividerNode.zPosition = -1
            barDividerNodes.append(barDividerNode)
            addChild(barDividerNode)
        }
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateManaBar() {
        progressBarNode.progress = .init(accumulatedManaPoints) / .init(totalManaPoints)
    }
}
