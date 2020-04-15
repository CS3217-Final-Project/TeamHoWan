//
//  WaitingRoomViewNode.swift
//  GameOfRunes
//
//  Created by Jermy on 15/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class WaitingRoomViewNode: SKSpriteNode {
    private let leaveNode: ButtonNode
    private let playOrReadyNode: PlayOrReadyNode
    private let hostAvatarOverviewNode: AvatarOverviewNode
    private let playerAvatarOverviewNode: AvatarOverviewNode
    var isHost: Bool = true {
        didSet {
            playOrReadyNode.buttonType = isHost ? .playButton : .readyButton
        }
    }
    var hostSelectedAvatar: Avatar? {
        get {
            hostAvatarOverviewNode.selectedAvatar
        }
        set {
            hostAvatarOverviewNode.selectedAvatar = newValue
        }
    }
    var playerSelectedAvatar: Avatar? {
        get {
            hostAvatarOverviewNode.selectedAvatar
        }
        set {
            hostAvatarOverviewNode.selectedAvatar = newValue
        }
    }
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutHostAvatarOverviewNode()
            layoutPlayerAvatarOverviewNode()
            layoutLeaveNode()
            layoutPlayOrReadyNode()
        }
    }
    
    init(size: CGSize) {
        let leaveButtonTexture = SKTexture(imageNamed: "leave-button")
        leaveNode = .init(
            size: leaveButtonTexture.size(),
            texture: leaveButtonTexture,
            buttonType: .leaveButton
        )
        
        playOrReadyNode = .init(
            size: leaveNode.size,
            texture: PlayOrReadyNode.playButtonTexture,
            buttonType: .playButton
        )
        
        hostAvatarOverviewNode = .init()
        playerAvatarOverviewNode = .init()
        super.init(texture: .init(imageNamed: "stage-selection-board"), color: .clear, size: size)
        
        isUserInteractionEnabled = true
        
        hostAvatarOverviewNode.zPosition = 50
        playerAvatarOverviewNode.zPosition = 50
        leaveNode.zPosition = 50
        playOrReadyNode.zPosition = 50
        
        hostSelectedAvatar = .elementalWizard
        playerSelectedAvatar = .elementalWizard
        
        addChild(hostAvatarOverviewNode)
        addChild(playerAvatarOverviewNode)
        addChild(leaveNode)
        addChild(playOrReadyNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutHostAvatarOverviewNode() {
        hostAvatarOverviewNode.size = size.applying(.init(scaleX: 0.4, y: 0.75))
        hostAvatarOverviewNode.position = .init(x: -size.width / 4.5, y: size.height / 12.75)
    }
    
    private func layoutPlayerAvatarOverviewNode() {
        playerAvatarOverviewNode.size = size.applying(.init(scaleX: 0.4, y: 0.75))
        playerAvatarOverviewNode.position = .init(x: size.width / 4.5, y: size.height / 12.75)
    }
    
    private func layoutLeaveNode() {
        leaveNode.size = leaveNode.size.scaleTo(width: size.width * 0.4)
        leaveNode.position = .init(x: -size.width / 4.5, y: -size.height / 2.75)
    }
    
    private func layoutPlayOrReadyNode() {
        playOrReadyNode.size = playOrReadyNode.size.scaleTo(width: size.width * 0.4)
        playOrReadyNode.position = .init(x: size.width / 4.5, y: -size.height / 2.75)
    }
}
