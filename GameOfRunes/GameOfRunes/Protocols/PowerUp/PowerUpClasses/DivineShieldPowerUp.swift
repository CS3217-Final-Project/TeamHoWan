//
//  DivineShieldPowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class DivineShieldPowerUp: ImmediatelyActivatedPowerUp, CastingAnimationPowerUp {
    static let shared = DivineShieldPowerUp()
    let manaUnitCost: Int = 0
    let duration: TimeInterval = 5
    let description: String = """
            Divine Shield
            Tap to use the divine shield bestowed by King
            Arthur himself which gives invulnerability
            """
    
    private init() { }
    
    func createEntity(at position: CGPoint, with size: CGSize) -> Entity? {
        DivineShieldPowerUpEntity(at: position, with: size)
    }
    
    func activate(at position: CGPoint, with size: CGSize?, gameEngine: GameEngine) {
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
