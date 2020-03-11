//
//  PlayerAreaNode.swift
//  GameOfRunes
//
//  Created by Jermy on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class PlayerAreaNode: SKSpriteNode {
    let healthBarNode: HealthBarNode
    let manaBarNode: ManaBarNode
    override var size: CGSize {
        didSet {
            print("Resize player area")
            layoutHealthBar()
            layoutManaBar()
        }
    }
    override var position: CGPoint {
        didSet {
            print("Re-position player area")
            layoutHealthBar()
            layoutManaBar()
        }
    }
    
    init(size: CGSize = .zero, position: CGPoint = .zero) {
        healthBarNode = .init()
        manaBarNode = .init()
        super.init(texture: .init(imageNamed: "player-area"), color: .clear, size: size)
        
        self.position = position
        healthBarNode.zPosition = 100
        manaBarNode.zPosition = 100
        addChild(healthBarNode)
        addChild(manaBarNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutHealthBar() {
        healthBarNode.size = size.applying(.init(scaleX: 0.45, y: 0.4))
        healthBarNode.position = .zero + .init(dx: -size.width / 4.5, dy: size.height / 4.5)
    }
    
    private func layoutManaBar() {
        manaBarNode.size = size.applying(.init(scaleX: 0.45, y: 0.4))
        manaBarNode.position = .zero + .init(dx: size.width / 4.5, dy: size.height / 4.5)
    }
}
