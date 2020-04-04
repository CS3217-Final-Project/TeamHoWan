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
    case backgroundLayer
    case unitLayer
    case powerUpAnimationLayer
    case removalAnimationLayer
    case gestureLayer
    case playerAreaLayer
    case highestPriorityLayer
    case manaDropLayer
}
