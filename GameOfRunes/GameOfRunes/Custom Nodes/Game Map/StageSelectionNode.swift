//
//  StageSelectionNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StageSelectionNode: SKSpriteNode {
    private let cancelNode: CancelNode
    private let playNode: PlayNode
    private let stageOverviewNode: StageOverviewNode
    var selectedStage: Stage? {
        didSet {
            stageOverviewNode.selectedStage = selectedStage
        }
    }
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutStageOverviewNode()
            layoutAvatarOverviewNode()
            layoutCancelNode()
            layoutPlayNode()
        }
    }
    
    init(size: CGSize, position: CGPoint = .zero) {
        stageOverviewNode = .init(size: size)
        cancelNode = .init()
        playNode = .init()
        super.init(texture: .init(imageNamed: "stage-selection-board"), color: .clear, size: size)
        
        isUserInteractionEnabled = true
        self.position = position
        addChild(stageOverviewNode)
        addChild(cancelNode)
        addChild(playNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutStageOverviewNode() {
        stageOverviewNode.size = size.applying(.init(scaleX: 0.4, y: 0.775))
        stageOverviewNode.position = .zero + .init(dx: -size.width / 4.5, dy: size.height / 11)
        stageOverviewNode.zPosition = 50
    }
    
    private func layoutAvatarOverviewNode() {
        
    }
    
    private func layoutCancelNode() {
        cancelNode.size = cancelNode.size.scaleTo(width: size.width * 0.4)
        cancelNode.position = .zero + .init(dx: -size.width / 4.5, dy: -size.height / 2.75)
        cancelNode.zPosition = 50
    }
    
    private func layoutPlayNode() {
        playNode.size = playNode.size.scaleTo(width: size.width * 0.4)
        playNode.position = .zero + .init(dx: size.width / 4.5, dy: -size.height / 2.75)
        playNode.zPosition = 50
    }
}
