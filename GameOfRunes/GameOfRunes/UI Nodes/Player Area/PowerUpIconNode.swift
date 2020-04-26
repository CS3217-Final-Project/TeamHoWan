//
//  PowerUpIconNode.swift
//  GameOfRunes
//
//  Created by Jermy on 13/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class PowerUpIconNode: ButtonNode {
    private static let normalFrame = SKTexture(imageNamed: "power-up-frame")
    private static let selectedFrame = SKTexture(imageNamed: "power-up-frame-selected")
    private let iconNode = SKSpriteNode()
    var powerUpType: PowerUpType {
        didSet {
            guard oldValue != powerUpType else {
                return
            }
            updateIcon()
        }
    }
    var selected = false {
        didSet {
            guard oldValue != selected else {
                return
            }
            texture = selected ? Self.selectedFrame : Self.normalFrame
        }
    }
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            iconNode.size = size.applying(.init(scaleX: 0.9, y: 0.9))
        }
    }
    
    init(powerUpType: PowerUpType) {
        self.powerUpType = powerUpType
        super.init(size: Self.normalFrame.size(), texture: Self.normalFrame, buttonType: .powerUpIconButton)
        
        iconNode.zPosition = -1
        updateIcon()
        addChild(iconNode)
    }
    
    private func updateIcon() {
        iconNode.texture = .init(imageNamed: "\(powerUpType)-icon")
    }
    
    override func onTouchEnded(_ touches: Set<UITouch>) {
        guard let container = parent?.parent as? PowerUpContainerNode else {
                return
        }
        
        container.selectedPowerUp = selected ? nil : powerUpType
        responder.onTapped(tappedNode: self)
    }
}
