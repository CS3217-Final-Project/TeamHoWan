//
//  TapResponder.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/**
 Conforming types can respond to tap events..
 This should be implemented by the `SKScene` that the tapped node
 is added to.
 */
protocol TapResponder: AnyObject {
    func onTapped(tappedNode: ButtonNode)
}
