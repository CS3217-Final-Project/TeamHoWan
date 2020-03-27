//
//  ButtonNode.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/**
 An `SKSpriteNode` that functions as a button.
 To be added to `SKScene` or it subclasses.
 */
class ButtonNode: SKSpriteNode {
    private var responder: TapResponder {
        guard let responder = scene as? TapResponder else {
            fatalError("This node can only be used within a `TapResponder` scene.")
        }
        return responder
    }

    init(size: CGSize, position: CGPoint, texture: SKTexture, name: String) {
        super.init(texture: texture, color: .darkGray, size: size)
        self.name = name
        self.size = size
        self.position = position
        isUserInteractionEnabled = true
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /** Forwards the button press event to the responder. */
    func buttonPressed() {
        if isUserInteractionEnabled {
            responder.onTapped(tappedNode: self)
        }
    }

    /** UIResponder touch handling. */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if containsTouches(touches: touches) {
            isHighlighted = true
        }
    }

    /** UIResponder touch handling. */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        isHighlighted = false

        if containsTouches(touches: touches) {
            buttonPressed()
        }
    }

    /** UIResponder touch handling. */
    override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        super.touchesCancelled(touches!, with: event)
        isHighlighted = false
    }
}
