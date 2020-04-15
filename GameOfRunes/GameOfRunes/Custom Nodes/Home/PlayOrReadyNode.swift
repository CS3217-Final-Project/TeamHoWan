//
//  PlayOrReadyNode.swift
//  GameOfRunes
//
//  Created by Jermy on 16/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class PlayOrReadyNode: ButtonNode {
    static let playButtonTexture = SKTexture(imageNamed: "play-button")
    static let readyButtonTexture = SKTexture(imageNamed: "ready-button")
    
    override var buttonType: ButtonType {
        didSet {
            texture = buttonType == .playButton ? Self.playButtonTexture : Self.readyButtonTexture
        }
    }
}
