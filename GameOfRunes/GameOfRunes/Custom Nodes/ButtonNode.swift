//
//  ButtonNode.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

protocol ButtonNodeResponderType : class {
    func buttonPressed(button: ButtonNode)
}

class ButtonNode : SKSpriteNode {
    private let defaultTexture: SKTexture
    private var responder: ButtonNodeResponderType {
        guard let responder = scene as? ButtonNodeResponderType else {
            fatalError("ButtonNode may only be used within a `ButtonNodeResponderType` scene.")
        }
        return responder
    }

    /// Indicates whether the button is currently highlighted (pressed).
    var isHighlighted = false {
        // Animate to a pressed / unpressed state when the highlight state changes.
        didSet {
            guard oldValue != isHighlighted else { return }
            removeAllActions()

            // Create a scale action to make the button look like it is slightly depressed.
            let newScale: CGFloat = isHighlighted ? 0.99 : 1.01
            let scaleAction = SKAction.scale(by: newScale, duration: 0.15)

            // Create a color blend action to darken the button slightly when it is depressed.
            let newColorBlendFactor: CGFloat = isHighlighted ? 1.0 : 0.0
            let colorBlendAction = SKAction.colorize(withColorBlendFactor: newColorBlendFactor, duration: 0.15)

            run(SKAction.group([scaleAction, colorBlendAction]))
        }
    }

    init (size: CGSize, name: String) {
        self.defaultTexture = SKTexture(imageNamed: "button")
        super.init(texture: defaultTexture, color: .lightGray, size: size)
        self.name = name
        self.size = size
        self.position = CGPoint(x: 100, y: 100)
        isUserInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /** Forwards the button press event to the responder. */
    func buttonPressed() {
        if isUserInteractionEnabled {
            responder.buttonPressed(button: self)
        }
    }

    /// UIResponder touch handling.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if containsTouches(touches: touches) {
            isHighlighted = true
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        isHighlighted = false

        if containsTouches(touches: touches) {
            buttonPressed()
        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        super.touchesCancelled(touches!, with: event)
        isHighlighted = false
    }

    /// Determine if any of the touches are within the `ButtonNode`.
    private func containsTouches(touches: Set<UITouch>) -> Bool {
        guard let scene = scene else { fatalError("Button must be used within a scene.") }

        return touches.contains { touch in
            let touchPoint = touch.location(in: scene)
            let touchedNode = scene.atPoint(touchPoint)
            return touchedNode === self || touchedNode.inParentHierarchy(self)
        }
    }
}
