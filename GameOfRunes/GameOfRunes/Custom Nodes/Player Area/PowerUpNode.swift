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
    private static let onTappedScaleFactor: CGFloat = 0.9
    private let powerUpIconNode = SKSpriteNode()
    private var identitySize: CGSize
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
            guard oldValue != size else {
                return
            }
            powerUpIconNode.size = size
            identitySize = size
        }
    }
    
    init(powerUpType: PowerUpType) {
        self.powerUpType = powerUpType
        let size = Self.normalFrame.size()
        identitySize = size
        super.init(texture: Self.normalFrame, color: .clear, size: size)
        
        isUserInteractionEnabled = true
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        run(.scale(to: Self.onTappedScaleFactor, duration: 0.05))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        run(.scale(to: identitySize, duration: 0.1))
        
        guard let touch = touches.first,
            let container = parent as? PowerUpContainerNode,
            atPoint(touch.location(in: self)) === powerUpIconNode else {
                return
        }
        
        container.selectedPowerUp = selected ? nil : powerUpType
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        run(.scale(to: identitySize, duration: 0.1))
    }
}
