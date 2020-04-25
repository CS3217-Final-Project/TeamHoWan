//
//  DivineBlessingPowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum DivineBlessingPowerUp: CircleActivatedPowerUp, Collidable, CastingAnimationPowerUp {
    static let type: PowerUpType = .divineBlessing
    static let manaUnitCost: Int = 0
    static let duration: TimeInterval = 1
    static let description: String = """
        Divine Blessing
        Draw a circle to invoke a divine blessing that
        simplifies all enemy gestures in the region
        """
    
    static func createEntity(at position: CGPoint, with size: CGSize) -> Entity? {
        DivineBlessingPowerUpEntity(at: position, with: size)
    }
    
    static func activate(at position: CGPoint, with size: CGSize?, gameEngine: GameEngine) {
        guard let size = size,
            let entity = createEntity(at: position, with: size) else {
                return
        }
        gameEngine.add(entity)
    }
    
    static func effectUponCollision(on enemy: Entity, gameEngine: GameEngine) {
        guard enemy.type == .enemyEntity,
            let enemyType = enemy.component(ofType: EnemyTypeComponent.self)?.enemyType,
            !enemyType.isPowerUpImmune else {
                return
        }
        gameEngine.setGesture(for: enemy, using: .verticalLine)
    }
}
