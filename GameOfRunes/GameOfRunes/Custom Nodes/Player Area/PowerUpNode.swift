//
//  PowerUpNode.swift
//  GameOfRunes
//
//  Created by Jermy on 13/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class PowerUpNode: SKSpriteNode {
    private static let normalFrame = SKTexture(imageNamed: "power-up-frame")
    private static let selectedFrame = SKTexture(imageNamed: "power-up-frame-selected")
    private let powerUpIconNode = SKSpriteNode()
    var powerUpType: PowerUpType {
        didSet {
            guard oldValue != powerUpType else {
                return
            }
            updatePowerUpIcon()
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
            powerUpIconNode.size = size
        }
    }
    
    init(powerUpType: PowerUpType) {
        self.powerUpType = powerUpType
        super.init(texture: Self.normalFrame, color: .clear, size: Self.normalFrame.size())
        
        powerUpIconNode.zPosition = -1
        updatePowerUpIcon()
        addChild(powerUpIconNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updatePowerUpIcon() {
        powerUpIconNode.texture = .init(imageNamed: "\(powerUpType)-icon")
    }
}
