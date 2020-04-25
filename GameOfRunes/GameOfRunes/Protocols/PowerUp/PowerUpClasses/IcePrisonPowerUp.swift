//
//  IcePrisonPowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum IcePrisonPowerUp: CircleActivatedPowerUp, Collidable, CastingAnimationPowerUp {
    static var type: PowerUpType {
        .icePrison
    }
    static var manaUnitCost: Int { 0 }
    static var duration: TimeInterval { 1 }
    static var description: String { """
        Ice Prison
        Draw a circle to call upon an ancient spell
        that freezes all enemies in the region
        """
    }
    
    static func createEntity(at position: CGPoint, with size: CGSize) -> Entity? {
        IcePrisonPowerUpEntity(at: position, with: size)
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
        gameEngine.changeMovementSpeed(for: enemy, to: enemyType.icePrisonSpeed, duration: 5)
    }
}
