//
//  PowerUp.swift
//  GameOfRunes
//
//  Created by Jermy on 9/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

protocol PowerUp {
    static var type: PowerUpType { get }
    static var description: String { get }
    static var manaUnitCost: Int { get }
    static var duration: TimeInterval { get }

    static func createEntity(at position: CGPoint, with size: CGSize) -> Entity?
    static func prepareForActivation(gameEngine: GameEngine)
    static func activate(at position: CGPoint, with size: CGSize?, gameEngine: GameEngine)
}
