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
    private let myAvatarOverviewNode: AvatarOverviewNode
    private let otherAvatarOverviewNode: AvatarOverviewNode
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
            if newValue {
                hostIcon.position = .init(x: -size.width / 9, y: size.height / 4.5)
            } else {
                hostIcon.position = .init(x: size.width / 3, y: size.height / 4.5)
            }
        }
    }
    var mySelectedAvatar: Avatar? {
        get {
            myAvatarOverviewNode.selectedAvatar
        }
        set {
            myAvatarOverviewNode.selectedAvatar = newValue
        }
    }
    var otherSelectedAvatar: Avatar? {
        get {
            otherAvatarOverviewNode.selectedAvatar
        }
        set {
            otherAvatarOverviewNode.selectedAvatar = newValue
        }
    }
    var myName: String? {
        get {
            myAvatarOverviewNode.customName
        }
        set {
            myAvatarOverviewNode.customName = newValue
        }
    }
    var otherName: String? {
        get {
            otherAvatarOverviewNode.customName
        }
        set {
            otherAvatarOverviewNode.customName = newValue
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
        myAvatarOverviewNode = .init(homeScene: homeScene)
        otherAvatarOverviewNode = .init()
        
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
        myAvatarOverviewNode.zPosition = 50
        otherAvatarOverviewNode.zPosition = 50
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
        
        myAvatarOverviewNode.viewOnlyAvatar = false
        otherAvatarOverviewNode.viewOnlyAvatar = true
        
        addChild(roomIdDisplayNode)
        addChild(hostIcon)
        addChild(myAvatarOverviewNode)
        addChild(otherAvatarOverviewNode)
        addChild(leaveNode)
        addChild(playOrReadyNode)
    }
    
    func setOthersToNil() {
        otherName = nil
        otherSelectedAvatar = nil
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
        hostIcon.position = .init(x: size.width / 3, y: size.height / 4.5)
    }
    
    private func layoutHostAvatarOverviewNode() {
        myAvatarOverviewNode.size = size.applying(.init(scaleX: 0.4, y: 0.65))
        myAvatarOverviewNode.position = .init(x: -size.width / 4.5, y: size.height / 40)
    }
    
    private func layoutPlayerAvatarOverviewNode() {
        otherAvatarOverviewNode.size = size.applying(.init(scaleX: 0.4, y: 0.65))
        otherAvatarOverviewNode.position = .init(x: size.width / 4.5, y: size.height / 40)
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
