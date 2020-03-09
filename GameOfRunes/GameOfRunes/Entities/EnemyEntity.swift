//
//  EnemyEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class EnemyEntity: GKEntity {
    
    init(enemyType: EnemyType, entityManager: EntityManager) {
        super.init()
        
        let enemyAtlas = SKTextureAtlas(named: enemyType.rawValue)
        let spriteComponent = SpriteComponent(texture: enemyAtlas.textureNamed("WALK_002"))
        
        let teamComponent = TeamComponent(team: .enemy)
        
        let moveComponent = MoveComponent(
            maxSpeed: 150.0,
            maxAcceleration: 5.0,
            radius: .init(spriteComponent.node.size.width) * 0.3,
            entityManager: entityManager
        )
        
        addComponent(spriteComponent)
        addComponent(teamComponent)
        addComponent(moveComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
