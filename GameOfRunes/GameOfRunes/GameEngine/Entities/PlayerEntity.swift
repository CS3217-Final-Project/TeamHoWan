//
//  PlayerEntity.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 27/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class PlayerEntity: Entity {
    override var type: EntityType {
        .playerEntity
    }
    
    init(gameEngine: GameEngine, healthNode: HealthBarNode, manaNode: ManaBarNode) {
        super.init()
        let healthComponent = HealthComponent(healthPoints: gameEngine.metadata.playerHealth)
        let manaComponent = ManaComponent(manaPoints: gameEngine.metadata.playerMana)
        let playerComponent = PlayerComponent(healthNode: healthNode, manaNode: manaNode)

        addComponent(healthComponent)
        addComponent(manaComponent)
        addComponent(playerComponent)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
