//
//  DivineShieldPowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum DivineShieldPowerUp: ImmediatelyActivatedPowerUp, CastingAnimationPowerUp {
    static var type: PowerUpType {
        .divineShield
    }
    static var manaUnitCost: Int { 0 }
    static var duration: TimeInterval { 5 }
    static var description: String { """
        Divine Shield
        Tap to use the divine shield bestowed by King
        Arthur himself which gives invulnerability
        """
    }
    
    static func createEntity(at position: CGPoint, with size: CGSize) -> Entity? {
        DivineShieldPowerUpEntity(at: position, with: size)
    }
    
    static func activate(at position: CGPoint, with size: CGSize?, gameEngine: GameEngine) {
        guard let renderNodeSize = gameEngine.rootRenderNode?.size else {
            return
        }

        let radius = renderNodeSize.width / 3
        let powerUpSize: CGSize = .init(width: radius, height: radius)
        
        guard let entity = createEntity(at: position, with: powerUpSize) else {
            return
        }
        gameEngine.add(entity)
        gameEngine.activateInvincibleEndPoint()
    }
}
