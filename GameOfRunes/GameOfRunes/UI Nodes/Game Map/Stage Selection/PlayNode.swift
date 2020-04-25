//
//  PlayNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class PlayNode: ButtonNode {
    init() {
        let texture = SKTexture(imageNamed: "play-button")
        super.init(size: texture.size(), texture: texture, buttonType: .playButton)
    }
}
