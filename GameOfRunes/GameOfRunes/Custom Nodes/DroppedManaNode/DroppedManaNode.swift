//
//  DroppedManaNode.swift
//  GameOfRunes
//
//  Created by Brian Yen on 15/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/**
 An `SKSpriteNode` that represents Mana dropped by a monster
 when the monster is killed. To be added to `SKScene` or its subclasses
 that implement the `DroppedManaResponderType` protocol (i.e. `GameScene`)
 */
class DroppedManaNode: SKSpriteNode {
    private weak var responder: DroppedManaResponderType?

    init(position: CGPoint, responder: DroppedManaResponderType) {
        self.responder = responder
        super.init(texture: SKTexture(imageNamed: "mana"),
                   color: .darkGray,
                   size: CGSize(width: GameConfig.Mana.manaWidth,
                                height: GameConfig.Mana.manaHeight))
        self.position = position
        isUserInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /** Forwards the node tap event to the responder. */
    func droppedManaTapped() {
        if let responder = responder,
            isUserInteractionEnabled {
            responder.droppedManaTapped(droppedManaNode: self)
        }
    }

    /** UIResponder touch handling. */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        if containsTouches(touches: touches) {
            droppedManaTapped()
        }
    }

    /** Determine if any of the touches are within the `DroppedManaNode`. */
    private func containsTouches(touches: Set<UITouch>) -> Bool {
        guard let scene = scene else {
            fatalError("Button must be used within a scene.")
        }

        return touches.contains { touch in
            let touchPoint = touch.location(in: scene)
            let touchedNode = scene.atPoint(touchPoint)

            return touchedNode === self || touchedNode.inParentHierarchy(self)
        }
    }
}
