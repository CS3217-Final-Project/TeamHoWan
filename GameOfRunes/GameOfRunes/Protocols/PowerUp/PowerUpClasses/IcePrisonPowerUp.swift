//
//  IcePrisonPowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class IcePrisonPowerUp: CircleActivatedPowerUp, Collidable, CastingAnimationPowerUp {
    var manaUnitCost: Int = 1
    var duration: TimeInterval = 1
    var description: String = """
            Ice Prison
            Draw a circle to call upon an ancient spell
            that freezes all enemies in the region
            """
    
    func createEntity(at position: CGPoint, with size: CGSize) -> Entity? {
        return IcePrisonPowerUpEntity(at: position, with: size)
    }
    
    func activate(at position: CGPoint, with size: CGSize?, gameEngine: GameEngine) {
        guard let size = size,
            let entity = createEntity(at: position, with: size) else {
                return
        }
        gameEngine.add(entity)
    }
    
    func didActivate(on enemy: Entity, gameEngine: GameEngine) {
        guard enemy.type == .enemyEntity,
            let enemyType = enemy.component(ofType: EnemyTypeComponent.self)?.enemyType,
            !enemyType.isPowerUpImmune else {
                return
        }
        gameEngine.changeMovementSpeed(for: enemy, to: enemyType.icePrisonSpeed, duration: 5)
    }
}
