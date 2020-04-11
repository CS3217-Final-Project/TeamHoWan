//
//  AnimationPowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

protocol Animatable {
    func getAnimationNode(at position: CGPoint, with size: CGSize, powerUp: PowerUp) -> SKSpriteNode
}
