//
//  Animatable.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

protocol Animatable {
    static func getAnimationNode(at position: CGPoint, with size: CGSize, powerUp: PowerUp.Type) -> SKSpriteNode
}
