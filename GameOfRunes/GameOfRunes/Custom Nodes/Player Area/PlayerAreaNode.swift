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
        didSet {
            print("Set new mana bar")
            oldValue.removeFromParent()
            addChild(manaBarNode)
            layoutManaBar()
        }
    }
    var powerUpContainerNode: PowerUpContainerNode {
        didSet {
            print("Set new power up container")
            oldValue.removeFromParent()
            addChild(powerUpContainerNode)
            layoutPowerUpContainer()
        }
    }
    var summonNode: SummonNode
    
    override var size: CGSize {
        // Swift's implementation: didSet can be called if new value is set INSIDE init
        didSet {
            guard oldValue != size else {
                return
            }
            print("Resize player area")
            layoutHealthBar()
            layoutManaBar()
            layoutPowerUpContainer()
            layoutSummonNode()
        }
    }
    override var position: CGPoint {
        didSet {
            guard oldValue != position else {
                return
            }
            print("Re-position player area")
            layoutHealthBar()
            layoutManaBar()
            layoutPowerUpContainer()
            layoutSummonNode()
        }
    }
    var healthBarSize: CGSize {
        didSet {
            layoutHealthBar()
        }
    }
    var manaBarSize: CGSize {
        didSet {
            layoutManaBar()
        }
    }
    var powerUpContainerSize: CGSize {
        didSet {
            layoutPowerUpContainer()
        }
    }
    var summonNodeSize: CGSize {
        didSet {
            layoutSummonNode()
        }
    }
    // with respect to the center of current node
    var healthBarPositionOffsetFromCenter: CGVector {
        didSet {
            layoutHealthBar()
        }
    }
    var manaBarPositionOffsetFromCenter: CGVector {
        didSet {
            layoutManaBar()
        }
    }
    var powerUpContainerPositionOffsetFromCenter: CGVector {
        didSet {
            layoutPowerUpContainer()
        }
    }
    var summonNodePositionOffsetFromCenter: CGVector {
        didSet {
            layoutSummonNode()
        }
    }
    
    init(size: CGSize = .zero, position: CGPoint = .zero) {
        healthBarNode = .init()
        manaBarNode = .init()
        powerUpContainerNode = .init(powerUpTypes: [.darkVortex, .hellfire, .icePrison])
        summonNode = .init()
        
        healthBarSize = size.applying(.init(scaleX: 0.45, y: 0.325))
        manaBarSize = size.applying(.init(scaleX: 0.45, y: 0.325))
        powerUpContainerSize = size.applying(.init(scaleX: 0.45, y: 0.5))
        summonNodeSize = summonNode.size.scaleTo(height: size.height * 0.5)
        
        healthBarPositionOffsetFromCenter = .init(dx: -size.width / 4.5, dy: size.height / 4)
        manaBarPositionOffsetFromCenter = .init(dx: size.width / 4.5, dy: size.height / 4)
        powerUpContainerPositionOffsetFromCenter = .init(dx: -size.width / 4.5, dy: -size.height / 5.5)
        summonNodePositionOffsetFromCenter = .init(dx: size.width / 4.5, dy: -size.height / 5.5)
        
        super.init(texture: .init(imageNamed: "player-area"), color: .clear, size: size)
        
        self.position = position
        addChild(healthBarNode)
        addChild(manaBarNode)
        addChild(powerUpContainerNode)
        addChild(summonNode)
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
    
    private func layoutPowerUpContainer() {
        powerUpContainerNode.anchorPoint = .init(x: 0.5, y: 0.5)
        powerUpContainerNode.size = powerUpContainerSize
        powerUpContainerNode.position = .zero + powerUpContainerPositionOffsetFromCenter
        powerUpContainerNode.zPosition = 100
    }
    
    private func layoutSummonNode() {
        summonNode.anchorPoint = .init(x: 0.5, y: 0.5)
        summonNode.size = summonNodeSize
        summonNode.position = .zero + summonNodePositionOffsetFromCenter
        summonNode.zPosition = 100
    }
}
