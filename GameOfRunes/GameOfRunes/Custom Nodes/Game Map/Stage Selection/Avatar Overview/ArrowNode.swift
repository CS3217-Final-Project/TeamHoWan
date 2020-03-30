//
//  ArrowNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class ArrowNode: ButtonNode {
    private let normalImage: SKTexture
    private let tappedImage: SKTexture
    
    init(buttonType: ButtonType) {
        let direction = buttonType == .leftButton ? "left" : "right"
        normalImage = .init(imageNamed: "\(direction)-arrow")
        tappedImage = .init(imageNamed: "\(direction)-arrow-tapped")
        super.init(size: normalImage.size(), texture: normalImage, buttonType: buttonType)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        texture = tappedImage
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        texture = normalImage
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        texture = normalImage
    }
}
