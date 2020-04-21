//
//  PlayerSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 27/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class PlayerSystem: GKComponentSystem<PlayerComponent>, System {
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        super.init(componentClass: PlayerComponent.self)
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        for component in components {
            updateComponent(component)
        }
    }
    
    private func updateComponent(_ component: PlayerComponent) {
        guard let playerEntity = component.entity,
            let gameEngine = gameEngine,
            let playerHealth = playerEntity.component(ofType: HealthComponent.self),
            let playerMana = playerEntity.component(ofType: ManaComponent.self),
            let playerScore = playerEntity.component(ofType: ScoreComponent.self) else {
                return
        }

        gameEngine.metadata.playerHealth = min(playerHealth.healthPoints, gameEngine.metadata.maxPlayerHealth)
        gameEngine.metadata.playerMana = min(playerMana.manaPoints, gameEngine.metadata.maxPlayerMana)
        gameEngine.metadata.score = playerScore.scorePoints
        playerHealth.healthPoints = gameEngine.metadata.playerHealth
        playerMana.manaPoints = gameEngine.metadata.playerMana
        component.healthNode?.livesLeft = playerHealth.healthPoints
        component.manaNode?.currentManaPoints = playerMana.manaPoints
        component.scoreNode?.setLabel(label: "\(playerScore.scorePoints)")
    }
    
    func addComponent(_ component: Component) {
        guard let component = component as? PlayerComponent else {
            return
        }
        
        super.addComponent(component)
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? PlayerComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
