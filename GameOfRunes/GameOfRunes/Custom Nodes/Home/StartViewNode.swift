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
    private let settingsButton: ButtonNode
    
    override var isUserInteractionEnabled: Bool {
        didSet {
            startButton.isUserInteractionEnabled = isUserInteractionEnabled
            settingsButton.isUserInteractionEnabled = isUserInteractionEnabled
        }
    }
    
    init(size: CGSize) {
        let startButtonTexture = SKTexture(imageNamed: "start-button-glow")
        startButton = ButtonNode(
            size: startButtonTexture.size().scaleTo(width: size.width * 0.8),
            texture: startButtonTexture,
            buttonType: .startButton,
            position: .init(x: 0.0, y: -size.height * 0.275)
        )
        
        let settingsButtonTexture = SKTexture(imageNamed: "settings-button")
        settingsButton = ButtonNode(
            size: settingsButtonTexture.size().scaleTo(width: size.width * 0.8),
            texture: settingsButtonTexture,
            buttonType: .settingsButton,
            position: .init(x: 0.0, y: -size.height * 0.425)
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
        addChild(settingsButton)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
