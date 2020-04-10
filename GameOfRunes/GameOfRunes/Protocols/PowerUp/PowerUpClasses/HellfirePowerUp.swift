//
//  HellfirePowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class HellfirePowerUp: CircleActivatedPowerUp, Collidable, AllAnimationPowerUp {
    static let shared = HellfirePowerUp()
    var manaUnitCost: Int = 0
    var duration: TimeInterval = 5
    var description: String = """
            Hellfire
            Draw a circle to invoke a ring of fire
            that destroys all enemies that touches it
            """
    
    private init() { }
    
    func createEntity(at position: CGPoint, with size: CGSize) -> Entity? {
        HellfirePowerUpEntity(at: position, with: size)
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
        gameEngine.unitForceRemoved(enemy)
    }
}
