//
//  BackNode.swift
//  GameOfRunes
//
//  Created by Jermy on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class BackNode: ButtonNode {
    private static let normalImage = SKTexture(imageNamed: "back-button")
    private static let tappedImage = SKTexture(imageNamed: "back-button-tapped")
    
    init() {
        super.init(size: Self.normalImage.size(), texture: Self.normalImage, buttonType: .backButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        texture = Self.tappedImage
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        texture = Self.normalImage
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        texture = Self.normalImage
    }
}
