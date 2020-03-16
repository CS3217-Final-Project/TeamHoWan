//
//  ButtonNodeResponderType.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/**
 A type that can respond to `ButtonNode` button press events.
 This should be implemented by the `SKScene` that the `ButtonNode`
 is added to.
 */
protocol ButtonNodeResponderType: AnyObject {
    func buttonPressed(button: SKSpriteNode)
}
