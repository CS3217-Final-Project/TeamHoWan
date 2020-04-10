//
//  DivineBlessingPowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class DivineBlessingPowerUp: CircleActivatedPowerUp, Collidable, CastingAnimationPowerUp {
    static let shared = DivineBlessingPowerUp()
    var manaUnitCost: Int = 1
    var duration: TimeInterval = 1
    var description: String = """
            Divine Blessing
            Draw a circle to invoke a divine blessing that
            simplifies all enemy gestures in the region
            """
    
    private init() { }
    
    func createEntity(at position: CGPoint, with size: CGSize) -> Entity? {
        DivineBlessingPowerUpEntity(at: position, with: size)
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
        gameEngine.setGesture(for: enemy, using: .verticalLine)
    }
}
