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
    
    init(size: CGSize = .zero, position: CGPoint = .zero) {
        healthBarNode = .init()
        manaBarNode = .init()
        powerUpContainerNode = .init()
        summonNode = .init()
        
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
        healthBarNode.size = size.applying(.init(scaleX: 0.45, y: 0.325))
        healthBarNode.position = .zero + .init(dx: -size.width / 4.5, dy: size.height / 4)
        healthBarNode.zPosition = 50
    }
    
    private func layoutManaBar() {
        manaBarNode.size = size.applying(.init(scaleX: 0.45, y: 0.325))
        manaBarNode.position = .zero + .init(dx: size.width / 4.5, dy: size.height / 4)
        manaBarNode.zPosition = 50
    }
    
    private func layoutPowerUpContainer() {
        powerUpContainerNode.size = size.applying(.init(scaleX: 0.45, y: 0.5))
        powerUpContainerNode.position = .zero + .init(dx: -size.width / 4.5, dy: -size.height / 5.5)
        powerUpContainerNode.zPosition = 50
    }
    
    private func layoutSummonNode() {
        summonNode.size = summonNode.size.scaleTo(height: size.height * 0.5)
        summonNode.position = .zero + .init(dx: size.width / 4.5, dy: -size.height / 5.5)
        summonNode.zPosition = 50
    }
}
