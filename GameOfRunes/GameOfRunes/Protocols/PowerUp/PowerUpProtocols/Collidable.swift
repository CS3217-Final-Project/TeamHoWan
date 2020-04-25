//
//  Collidable.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

protocol Collidable {
    static func effectUponCollision(on enemy: Entity, gameEngine: GameEngine)
}
