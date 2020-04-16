//
//  AvatarOverviewNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class AvatarOverviewNode: SKSpriteNode {
    private let avatarLabelNode = AvatarLabelNode()
    private let avatarSelectionNode = AvatarSelectionNode()
    private let healthBarNode = HealthBarNode()
    private let manaBarNode = ManaBarNode()
    private let powerUpDescriptionNode = PowerUpDescriptionNode()
    private weak var homeScene: GameHomeScene?
    
    var selectedAvatar: Avatar? {
        didSet {
            guard let avatar = selectedAvatar else {
                setComponentsToVisible(isVisible: false)
                return
            }
            setComponentsToVisible(isVisible: true)
            
            avatarLabelNode.displayedValue = customName ?? avatar.name
            
            avatarSelectionNode.avatar = avatar
            
            healthBarNode.totalLives = avatar.health
            healthBarNode.livesLeft = avatar.health
            
            manaBarNode.numManaUnits = avatar.manaUnits
            manaBarNode.currentManaPoints = manaBarNode.totalManaPoints
            
            powerUpDescriptionNode.powerUpContainerNode.powerUpTypes = avatar.powerUps
        }
    }
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutAvatarLabelNode()
            layoutAvatarSelectionNode()
            layoutHealthBarNode()
            layoutManaBarNode()
            layoutPowerUpDescriptionNode()
        }
    }
    var viewOnlyAvatar: Bool = false {
        didSet {
            avatarSelectionNode.leftArrowNode.isHidden = viewOnlyAvatar
            avatarSelectionNode.rightArrowNode.isHidden = viewOnlyAvatar
        }
    }
    var customName: String? {
        didSet {
            avatarLabelNode.displayedValue = customName ?? selectedAvatar?.name ?? ""
        }
    }
    
    init(homeScene: GameHomeScene? = nil) {
        self.homeScene = homeScene
        super.init(texture: nil, color: .clear, size: .zero)
        
        avatarLabelNode.zPosition = 1
        avatarSelectionNode.zPosition = 1
        healthBarNode.zPosition = 1
        manaBarNode.zPosition = 3
        powerUpDescriptionNode.zPosition = 1
        
        setComponentsToVisible(isVisible: false)
        
        avatarSelectionNode.leftArrowNode.customResponder = self
        avatarSelectionNode.rightArrowNode.customResponder = self
        
        addChild(avatarLabelNode)
        addChild(avatarSelectionNode)
        addChild(healthBarNode)
        addChild(manaBarNode)
        addChild(powerUpDescriptionNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setComponentsToVisible(isVisible: Bool) {
        avatarLabelNode.isHidden = !isVisible
        avatarSelectionNode.isHidden = !isVisible
        healthBarNode.isHidden = !isVisible
        manaBarNode.isHidden = !isVisible
        powerUpDescriptionNode.isHidden = !isVisible
    }
    
    private func layoutAvatarLabelNode() {
        avatarLabelNode.size = avatarLabelNode.size.scaleTo(width: size.width)
        avatarLabelNode.position = .init(x: 0.0, y: size.height / 2.5)
    }
    
    private func layoutAvatarSelectionNode() {
        avatarSelectionNode.size = size.applying(.init(scaleX: 1.0, y: 0.35))
        avatarSelectionNode.position = .init( x: 0.0, y: size.height / 6.5)
    }
    
    private func layoutHealthBarNode() {
        healthBarNode.size = size.applying(.init(scaleX: 1.0, y: 0.08))
        healthBarNode.position = .init(x: 0.0, y: -size.height / 13.5)
    }
    
    private func layoutManaBarNode() {
        manaBarNode.size = size.applying(.init(scaleX: 1.0, y: 0.08))
        manaBarNode.position = .init(x: 0.0, y: -size.height / 5.5)
    }
    
    private func layoutPowerUpDescriptionNode() {
        powerUpDescriptionNode.size = size.applying(.init(scaleX: 1.0, y: 0.25))
        powerUpDescriptionNode.position = .init(x: 0.0, y: (-size.height + powerUpDescriptionNode.size.height) / 2)
    }
}

extension AvatarOverviewNode: TapResponder {
    func onTapped(tappedNode: ButtonNode) {
        selectedAvatar = tappedNode.buttonType == .leftButton ? selectedAvatar?.prevAvatar : selectedAvatar?.nextAvatar
        if let homeScene = homeScene {
            homeScene.toggleAvatar(avatar: selectedAvatar)
        }
    }
}
