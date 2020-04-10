//
//  PowerUp.swift
//  GameOfRunes
//
//  Created by Jermy on 9/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

protocol PowerUp {
    var description: String { get }
    var manaUnitCost: Int { get }
    var duration: TimeInterval { get }

    func createEntity(at position: CGPoint, with size: CGSize) -> Entity?
    func prepareForActivation(gameEngine: GameEngine)
    func activate(at position: CGPoint, with size: CGSize?, gameEngine: GameEngine)
}


