//
//  startViewNode.swift
//  GameOfRunes
//
//  Created by Jermy on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StartViewNode: SKNode {
    private let startButton: ButtonNode
    
    override var isUserInteractionEnabled: Bool {
        didSet {
            startButton.isUserInteractionEnabled = isUserInteractionEnabled
        }
    }
    
    init(size: CGSize) {
        let buttonTexture = SKTexture(imageNamed: "start-button-glow")
        startButton = ButtonNode(
            size: buttonTexture.size().scaleTo(width: size.width * 0.8),
            texture: buttonTexture,
            buttonType: .startButton,
            position: .init(x: 0.0, y: -size.height * 0.3)
        )
        
        super.init()
        
        isUserInteractionEnabled = true
        
        let gameIconTexture = SKTexture(imageNamed: "GameOfRunes-logo-transparent")
        let gameIcon = SKSpriteNode(
            texture: gameIconTexture,
            size: gameIconTexture.size().scaleTo(width: size.width * 0.8)
        )
        gameIcon.position = .init(x: 0.0, y: size.height * 0.125)
        
        addChild(gameIcon)
        addChild(startButton)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
