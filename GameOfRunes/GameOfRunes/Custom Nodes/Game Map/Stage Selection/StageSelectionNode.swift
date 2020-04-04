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
    private let avatarOverviewNode: AvatarOverviewNode
    var selectedStage: Stage? {
        didSet {
            stageOverviewNode.selectedStage = selectedStage
        }
    }
    var selectedAvatar: Avatar? {
        get {
            avatarOverviewNode.selectedAvatar
        }
        set {
            avatarOverviewNode.selectedAvatar = newValue
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
        stageOverviewNode = .init()
        avatarOverviewNode = .init()
        cancelNode = .init()
        playNode = .init()
        super.init(texture: .init(imageNamed: "stage-selection-board"), color: .clear, size: size)
        
        isUserInteractionEnabled = true
        self.position = position
        
        stageOverviewNode.zPosition = 50
        avatarOverviewNode.zPosition = 50
        cancelNode.zPosition = 50
        playNode.zPosition = 50
        
        addChild(stageOverviewNode)
        addChild(avatarOverviewNode)
        addChild(cancelNode)
        addChild(playNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updatePowerUpDescription() {
        avatarOverviewNode.updatePowerUpDescription()
    }
    
    private func layoutStageOverviewNode() {
        stageOverviewNode.size = size.applying(.init(scaleX: 0.4, y: 0.775))
        stageOverviewNode.position = .init(x: -size.width / 4.5, y: size.height / 11)
    }
    
    private func layoutAvatarOverviewNode() {
        avatarOverviewNode.size = size.applying(.init(scaleX: 0.4, y: 0.75))
        avatarOverviewNode.position = .init(x: size.width / 4.5, y: size.height / 12.75)
    }
    
    private func layoutCancelNode() {
        cancelNode.size = cancelNode.size.scaleTo(width: size.width * 0.4)
        cancelNode.position = .init(x: -size.width / 4.5, y: -size.height / 2.75)
    }
    
    private func layoutPlayNode() {
        playNode.size = playNode.size.scaleTo(width: size.width * 0.4)
        playNode.position = .init(x: size.width / 4.5, y: -size.height / 2.75)
    }
}
