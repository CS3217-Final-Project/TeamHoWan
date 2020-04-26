//
//  CancelNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class CancelNode: ButtonNode {
    init() {
        let texture = SKTexture(imageNamed: "cancel-button")
        super.init(size: texture.size(), texture: texture, buttonType: .cancelButton)
    }
}
