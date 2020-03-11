//
//  PlayerAreaNode.swift
//  GameOfRunes
//
//  Created by Jermy on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class PlayerAreaNode: SKSpriteNode {
    var healthBarNode: HealthBarNode {
        // Swift's implementation: didSet will only be called for every new value set AFTER init
        didSet {
            print("Set new health bar")
            oldValue.removeFromParent()
            addChild(healthBarNode)
            layoutHealthBar()
        }
    }
    var manaBarNode: ManaBarNode {
        // Swift's implementation: didSet will only be called for every new value set AFTER init
        didSet {
            print("Set new mana bar")
            oldValue.removeFromParent()
            addChild(manaBarNode)
            layoutManaBar()
        }
    }
    override var size: CGSize {
        // Swift's implementation: didSet can be called if new value is set INSIDE init
        didSet {
            guard oldValue != size else {
                return
            }
            print("Resize player area")
            layoutHealthBar()
            layoutManaBar()
        }
    }
    override var position: CGPoint {
        // Swift's implementation: didSet can be called if new value is set INSIDE init
        didSet {
            guard oldValue != position else {
                return
            }
            print("Re-position player area")
            layoutHealthBar()
            layoutManaBar()
        }
    }
    lazy var healthBarSize = size.applying(.init(scaleX: 0.45, y: 0.4))
    lazy var manaBarSize = size.applying(.init(scaleX: 0.45, y: 0.4))
    // with respect to the center of current node
    lazy var healthBarPositionOffsetFromCenter = CGVector(dx: -size.width / 4.5, dy: size.height / 4.5)
    lazy var manaBarPositionOffsetFromCenter = CGVector(dx: size.width / 4.5, dy: size.height / 4.5)
    
    init(size: CGSize = .zero, position: CGPoint = .zero) {
        healthBarNode = .init()
        manaBarNode = .init()
        super.init(texture: .init(imageNamed: "player-area"), color: .clear, size: size)
        
        self.position = position
        addChild(healthBarNode)
        addChild(manaBarNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutHealthBar() {
        healthBarNode.anchorPoint = .init(x: 0.5, y: 0.5)
        healthBarNode.size = healthBarSize
        healthBarNode.position = .zero + healthBarPositionOffsetFromCenter
        healthBarNode.zPosition = 100
    }
    
    private func layoutManaBar() {
        manaBarNode.anchorPoint = .init(x: 0.5, y: 0.5)
        manaBarNode.size = manaBarSize
        manaBarNode.position = .zero + manaBarPositionOffsetFromCenter
        manaBarNode.zPosition = 100
    }
}
