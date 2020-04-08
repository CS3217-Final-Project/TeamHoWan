//
//  ContactDelegate.swift
//  GameOfRunes
//
//  Created by Andy on 26/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

protocol ContactDelegate: NSObject, SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact)
}
