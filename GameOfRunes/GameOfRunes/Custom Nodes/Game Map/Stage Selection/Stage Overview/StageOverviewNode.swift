//
//  StageOverviewNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StageOverviewNode: SKSpriteNode {
    private let stageLabelNode = StageOverviewLabelNode()
    private let arenaViewNode = SKSpriteNode()
    private let stageDescriptionNode = StageOverviewDescriptionNode()
    var selectedStage: Stage? {
        didSet {
            guard let stage = selectedStage else {
                return
            }
            
            stageLabelNode.stageName = stage.name
            stageLabelNode.stageGroupName = stage.groupName
            
            arenaViewNode.texture = .init(imageNamed: "\(stage.arena)")
            
            stageDescriptionNode.difficulty = stage.difficulty
            stageDescriptionNode.numWaves = stage.numWaves
            stageDescriptionNode.highScore = stage.highScore
            stageDescriptionNode.achievementBadgeNode.achievementLevel = stage.achievement
        }
    }
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutStageLabelNode()
            layoutArenaViewNode()
            layoutStageDescriptionNode()
        }
    }
    
    init(size: CGSize) {
        super.init(texture: nil, color: .cyan, size: size)
        
        stageLabelNode.zPosition = 1
        arenaViewNode.zPosition = 1
        stageDescriptionNode.zPosition = 1
        
        addChild(stageLabelNode)
        addChild(arenaViewNode)
        addChild(stageDescriptionNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutStageLabelNode() {
        stageLabelNode.size = stageLabelNode.size.scaleTo(width: size.width * 1.2)
        stageLabelNode.position = .init(x: 0.0, y: (size.height - stageLabelNode.size.height) / 2)
    }
    
    private func layoutArenaViewNode() {
        arenaViewNode.size = size.applying(.init(scaleX: 1.0, y: 0.4))
        arenaViewNode.position = .init(x: 0.0, y: size.height / 30)
    }
    
    private func layoutStageDescriptionNode() {
        stageDescriptionNode.size = size.applying(.init(scaleX: 1.0, y: 0.325))
        stageDescriptionNode.position = .init(x: 0.0, y: (-size.height + stageDescriptionNode.size.height) / 2)
    }
}
