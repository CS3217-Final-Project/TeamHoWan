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
    
    init(gameEngine: GameEngine, healthNode: HealthBarNode, manaNode: ManaBarNode, scoreNode: ScoreNode) {
        super.init()
        let healthComponent = HealthComponent(healthPoints: gameEngine.metadata.playerHealth)
        let manaComponent = ManaComponent(manaPoints: gameEngine.metadata.playerMana)
        let scoreComponent = ScoreComponent(scorePoints: gameEngine.metadata.score)
        let playerComponent = PlayerComponent(healthNode: healthNode, manaNode: manaNode, scoreNode: scoreNode)

        addComponent(healthComponent)
        addComponent(scoreComponent)
        addComponent(manaComponent)
        addComponent(playerComponent)
    }
}
