//
//  SpriteLayerType.swift
//  GameOfRunes
//
//  Created by Brian Yen on 19/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

/**
 Used by `SpriteComponent` and `SpriteSystem` to determine
 which `GameScene` layer to add the Sprite's `SKNode` to.
 */
enum SpriteLayerType {
    case enemyLayer
    case powerUpAnimationLayer
    case manaDropLayer
    case defaultLayer //Specifies addition to `GameScene`'s `SKScene` node directly
}
