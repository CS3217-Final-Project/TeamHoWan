//
//  startViewNode.swift
//  GameOfRunes
//
//  Created by Jermy on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class StartViewNode: SKNode {
    init(size: CGSize) {
        super.init()
        
        let gameIconTexture = SKTexture(imageNamed: "GameOfRunes-logo-transparent")
        let gameIcon = SKSpriteNode(
            texture: gameIconTexture,
            size: gameIconTexture.size().scaleTo(width: size.width * 0.8)
        )
        gameIcon.position = .init(x: 0.0, y: size.height * 0.125)
        
        let buttonTexture = SKTexture(imageNamed: "start-button-glow")
        let startButton = ButtonNode(
            size: buttonTexture.size().scaleTo(width: size.width * 0.8),
            texture: buttonTexture,
            buttonType: .startButton,
            position: .init(x: 0.0, y: -size.height * 0.3)
        )
        
        addChild(gameIcon)
        addChild(startButton)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
