//
//  WaitingRoomViewNode.swift
//  GameOfRunes
//
//  Created by Jermy on 15/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class WaitingRoomViewNode: SKSpriteNode {
    private let roomIdDisplayNode: StackedLabelsNode = .init(backgroundTexture: .init(imageNamed: "stacked-labels"))
    private let hostIcon: SKSpriteNode = .init(imageNamed: "host-icon")
    private let hostAvatarOverviewNode: AvatarOverviewNode
    private let playerAvatarOverviewNode: AvatarOverviewNode
    private let leaveNode: ButtonNode
    private let playOrReadyNode: PlayOrReadyNode

    var roomId: String {
        get {
            roomIdDisplayNode.bottomLabelNode.text ?? ""
        }
        set {
            roomIdDisplayNode.bottomLabelNode.text = newValue
        }
    }
    var isHost: Bool {
        get {
            playOrReadyNode.buttonType == .playButton
        }
        set {
            playOrReadyNode.buttonType = newValue ? .playButton : .readyButton
            
            hostAvatarOverviewNode.viewOnlyAvatar = !isHost
            playerAvatarOverviewNode.viewOnlyAvatar = isHost
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
            playerAvatarOverviewNode.selectedAvatar
        }
        set {
            playerAvatarOverviewNode.selectedAvatar = newValue
        }
    }
    var hostName: String? {
        get {
            hostAvatarOverviewNode.customName
        }
        set {
            hostAvatarOverviewNode.customName = newValue
        }
    }
    var playerName: String? {
        get {
            playerAvatarOverviewNode.customName
        }
        set {
            playerAvatarOverviewNode.customName = newValue
        }
    }
    
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutRoomIdDisplayNode()
            layoutHostIcon()
            layoutHostAvatarOverviewNode()
            layoutPlayerAvatarOverviewNode()
            layoutLeaveNode()
            layoutPlayOrReadyNode()
        }
    }
    
    init(homeScene: GameHomeScene, size: CGSize) {
        hostAvatarOverviewNode = .init(homeScene: homeScene)
        playerAvatarOverviewNode = .init(homeScene: homeScene)
        
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
        
        super.init(texture: .init(imageNamed: "multiplayer-avatar-board"), color: .clear, size: size)
        
        isUserInteractionEnabled = true
        
        roomIdDisplayNode.zPosition = 50
        hostIcon.zPosition = 75
        hostAvatarOverviewNode.zPosition = 50
        playerAvatarOverviewNode.zPosition = 50
        leaveNode.zPosition = 50
        playOrReadyNode.zPosition = 50
        
        // styling
        roomIdDisplayNode.topLabelNode.fontColor = .black
        roomIdDisplayNode.topLabelNode.text = "Room ID"
        roomIdDisplayNode.bottomLabelNode.fontColor = .black
        roomIdDisplayNode.layoutTopLabelNode = {
            self.roomIdDisplayNode.topLabelNode.position = .init(x: 0.0, y: self.roomIdDisplayNode.size.height / 12)
            self.roomIdDisplayNode.topLabelNode.fontSize = self.roomIdDisplayNode.size.height / 6
        }
        roomIdDisplayNode.layoutBottomLabelNode = {
            self.roomIdDisplayNode.bottomLabelNode.position = .init(
                x: 0.0,
                y: -self.roomIdDisplayNode.size.height / 4.5
            )
            self.roomIdDisplayNode.bottomLabelNode.fontSize = self.roomIdDisplayNode.size.height / 4.5
        }
        roomIdDisplayNode.layoutTopLabelNode()
        roomIdDisplayNode.layoutBottomLabelNode()
         
        addChild(roomIdDisplayNode)
        addChild(hostIcon)
        addChild(hostAvatarOverviewNode)
        addChild(playerAvatarOverviewNode)
        addChild(leaveNode)
        addChild(playOrReadyNode)
    }
    
    func setOthersToNil() {
        playerName = nil
        playerSelectedAvatar = nil
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutRoomIdDisplayNode() {
        roomIdDisplayNode.size = .init(width: size.width * 0.65, height: size.height / 7.5)
        roomIdDisplayNode.position = .init(x: 0.0, y: size.height / 2.425)
    }
    
    private func layoutHostIcon() {
        hostIcon.size = hostIcon.size.scaleTo(width: size.width * 0.075)
        hostIcon.position = .init(x: -size.width / 9, y: size.height / 4.5)
    }
    
    private func layoutHostAvatarOverviewNode() {
        hostAvatarOverviewNode.size = size.applying(.init(scaleX: 0.4, y: 0.65))
        hostAvatarOverviewNode.position = .init(x: -size.width / 4.5, y: size.height / 40)
    }
    
    private func layoutPlayerAvatarOverviewNode() {
        playerAvatarOverviewNode.size = size.applying(.init(scaleX: 0.4, y: 0.65))
        playerAvatarOverviewNode.position = .init(x: size.width / 4.5, y: size.height / 40)
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
