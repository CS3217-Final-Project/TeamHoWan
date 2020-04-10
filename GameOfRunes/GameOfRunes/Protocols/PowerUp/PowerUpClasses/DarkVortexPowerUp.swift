//
//  DarkVortexPowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class DarkVortexPowerUp: TapActivatedPowerUp, CastingAnimationPowerUp {
    static let shared = DarkVortexPowerUp()
    var manaUnitCost: Int = 5
    var duration: TimeInterval = 1
    var description: String = """
            Dark Vortex
            Tap on the arena to summon a dark vortex
            that pulls nearby enemies towards it
            """
    
    private init() { }
    
    func createEntity(at position: CGPoint, with size: CGSize) -> Entity? {
        return DarkVortexPowerUpEntity(at: position, with: size)
    }
    
    func activate(at position: CGPoint, with size: CGSize?, gameEngine: GameEngine) {
        let radius = (gameEngine.gameScene?.size.width ?? UIScreen.main.bounds.width) / 3
        let powerUpSize: CGSize = .init(width: radius, height: radius)
        
        guard let entity = createEntity(at: position, with: powerUpSize) else {
                return
        }
        gameEngine.add(entity)
    }
}
