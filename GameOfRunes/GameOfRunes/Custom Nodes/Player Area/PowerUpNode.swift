//
//  PowerUpNode.swift
//  GameOfRunes
//
//  Created by Jermy on 17/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class PowerUpNode: SKSpriteNode {
    private let powerUpIconNode: PowerUpIconNode
    private let powerUpManaCostLabel = SKLabelNode(fontNamed: GameConfig.fontName)
    var selected: Bool {
        get {
            powerUpIconNode.selected
        }
        set {
            powerUpIconNode.selected = newValue
        }
    }
    var powerUpType: PowerUpType {
        powerUpIconNode.powerUpType
    }
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            
            layoutContent()
        }
    }
    
    init(powerUpType: PowerUpType) {
        powerUpIconNode = .init(powerUpType: powerUpType)
        super.init(texture: nil, color: .clear, size: powerUpIconNode.size.applying(.init(scaleX: 0.75, y: 1.0)))
        
        powerUpManaCostLabel.text = "\(powerUpType.manaUnitCost)"
        powerUpManaCostLabel.fontColor = .black
        
        addChild(powerUpIconNode)
        addChild(powerUpManaCostLabel)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutContent() {
        powerUpIconNode.size = .init(width: size.width, height: size.width)
        powerUpManaCostLabel.fontSize = size.width / 2.5
        
        powerUpIconNode.position = .init(x: 0.0, y: (size.height - size.width) / 2)
        powerUpManaCostLabel.position = .init(x: 0.0, y: -size.width / 1.5)
    }
}
