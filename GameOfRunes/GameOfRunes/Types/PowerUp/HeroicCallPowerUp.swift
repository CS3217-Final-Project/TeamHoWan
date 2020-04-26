//
//  HeroicCallPowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum HeroicCallPowerUp: ImmediatelyActivatedPowerUp {
    static let type: PowerUpType = .heroicCall
    static let manaUnitCost: Int = 4
    static let duration: TimeInterval = 0
    static let description: String = """
            Heroic Call
            Tap to to call upon a wave of elite knights
            to fight against incoming enemies
            """
    
    static func createEntity(at position: CGPoint, with size: CGSize) -> Entity? {
        nil
    }
    
    static func activate(at position: CGPoint, with size: CGSize?, gameEngine: GameEngine) {
        gameEngine.spawnPlayerUnitWave()
    }
}
