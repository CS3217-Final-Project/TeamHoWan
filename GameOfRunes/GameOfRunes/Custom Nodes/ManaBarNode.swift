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
            print(accumulatedManaPoints)
            updateManaBar()
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
        }
    }
    
    init(numManaUnits: Int, manaPointsPerUnit: Int, initialManaPoints: Int = 0) {
        self.numManaUnits = max(1, numManaUnits)
        self.manaPointsPerUnit = max(1, manaPointsPerUnit)
        accumulatedManaPoints = initialManaPoints
        let texture = SKTexture(imageNamed: "mana-container")
        progressBarNode = .init(color: .init(hex: "#14ea52", alpha: 1.0), size: texture.size())
        super.init(texture: texture, color: .clear, size: texture.size())
        
        progressBarNode.zPosition = -1
        addChild(progressBarNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateManaBar() {
        progressBarNode.progress = .init(accumulatedManaPoints) / .init(totalManaPoints)
    }
}
