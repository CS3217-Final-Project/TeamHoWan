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
 that implement the `DroppedManaResponder` protocol (i.e. `GameScene`)
 */
class DroppedManaNode: SKSpriteNode {
    private weak var responder: DroppedManaResponder?
    weak var droppedManaEntity: DroppedManaEntity?

    init(position: CGPoint, responder: DroppedManaResponder) {
        self.responder = responder
        super.init(texture: nil,
                   color: .darkGray,
                   size: CGSize(width: GameConfig.Mana.manaWidth,
                                height: GameConfig.Mana.manaHeight))
        self.position = position
        isUserInteractionEnabled = true
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /** UIResponder touch handling. */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        guard let touch = touches.first,
            let manaLayer = parent,
            manaLayer.atPoint(touch.location(in: manaLayer)) === self else {
            return
        }
        
        // forwards the node tap event to the responder
        responder?.droppedManaTapped(droppedManaNode: self)
    }
}
