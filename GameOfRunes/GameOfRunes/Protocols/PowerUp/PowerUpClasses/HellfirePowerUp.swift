//
//  HellfirePowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class HellfirePowerUp: CircleActivatedPowerUp, Collidable, AllAnimationPowerUp {
    var description: String

    func createEntity(at position: CGPoint, with size: CGSize) -> Entity? {
        
    }
    
    func activate(at position: CGPoint, with size: CGSize?, gameEngine: GameEngine) {
        
    }
    
    func didActivate(on enemy: Entity, gameEngine: GameEngine) {

    }
}
