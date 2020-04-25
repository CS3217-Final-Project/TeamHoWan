//
//  StageOverviewDescriptionNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StageOverviewDescriptionNode: SKSpriteNode {
    private let difficultyLabelNode = StackedLabelsNode()
    private let numWavesLabelNode = StackedLabelsNode()
    private let highScoreLabelNode = StackedLabelsNode()
    let achievementBadgeNode = AchievementBadgeNode()
    
    var difficulty: Int {
        get {
            Int(difficultyLabelNode.bottomLabelNode.text ?? "0") ?? 0
        }
        set {
            difficultyLabelNode.bottomLabelNode.text = "\(newValue)"
        }
    }
    var numWaves: Int {
        get {
            Int(numWavesLabelNode.bottomLabelNode.text ?? "0") ?? 0
        }
        set {
            numWavesLabelNode.bottomLabelNode.text = "\(newValue)"
        }
    }
    var highScore: Int {
        get {
            Int(highScoreLabelNode.bottomLabelNode.text ?? "0") ?? 0
        }
        set {
            highScoreLabelNode.bottomLabelNode.text = "\(newValue)"
        }
    }
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutDifficultyLabelNode()
            layoutNumWavesLabelNode()
            layoutHighScoreLabelNode()
            layoutAchievementBadeNode()
        }
    }
    
    init() {
        super.init(texture: nil, color: .clear, size: .zero)
        
        difficultyLabelNode.topLabelNode.text = "Difficulty"
        numWavesLabelNode.topLabelNode.text = "Waves"
        highScoreLabelNode.topLabelNode.text = "High Score"
        
        difficultyLabelNode.zPosition = 1
        numWavesLabelNode.zPosition = 1
        highScoreLabelNode.zPosition = 1
        achievementBadgeNode.zPosition = 1
        
        addChild(difficultyLabelNode)
        addChild(numWavesLabelNode)
        addChild(highScoreLabelNode)
        addChild(achievementBadgeNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutDifficultyLabelNode() {
        difficultyLabelNode.size = size.applying(.init(scaleX: 0.5, y: 0.5))
        difficultyLabelNode.position = .init(x: -size.width / 4, y: size.height / 4)
    }
    
    private func layoutNumWavesLabelNode() {
        numWavesLabelNode.size = size.applying(.init(scaleX: 0.5, y: 0.5))
        numWavesLabelNode.position = .init(x: size.width / 4, y: size.height / 4)
    }
    
    private func layoutHighScoreLabelNode() {
        highScoreLabelNode.size = size.applying(.init(scaleX: 0.5, y: 0.5))
        highScoreLabelNode.position = .init(x: -size.width / 4, y: -size.height / 4)
    }
    
    private func layoutAchievementBadeNode() {
        achievementBadgeNode.size = achievementBadgeNode.size.scaleTo(height: size.height / 2)
        achievementBadgeNode.position = .init(x: size.width / 4, y: -size.height / 4)
    }
}
