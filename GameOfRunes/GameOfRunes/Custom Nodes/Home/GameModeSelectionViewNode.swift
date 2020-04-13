//
//  GameModeSelectionViewNode.swift
//  GameOfRunes
//
//  Created by Jermy on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class GameModeSelectionViewNode: SKNode {
    init(size: CGSize) {
        super.init()
        
        let singlePlayerButtonTexture = SKTexture(imageNamed: "single-player-button")
        let singlePlayerButton = ButtonNode(
            size: singlePlayerButtonTexture.size().scaleTo(width: size.width * 0.4),
            texture: singlePlayerButtonTexture,
            buttonType: .singlePlayerButton,
            position: .init(x: 0.0, y: size.height * 0.2)
        )
        
        let multiplayerButtonTexture = SKTexture(imageNamed: "multiplayer-button")
        let multiplayerButton = ButtonNode(
            size: multiplayerButtonTexture.size().scaleTo(width: size.width * 0.4),
            texture: multiplayerButtonTexture,
            buttonType: .multiplayerButton,
            position: .init(x: 0.0, y: -size.height * 0.2)
        )
        
        addChild(singlePlayerButton)
        addChild(multiplayerButton)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
