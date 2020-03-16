//
//  SystemManager.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class SystemManager {
    private unowned var gameEngine: GameEngine
    private var systems = [System]()
    private let manaSystem = ManaSystem()
    private let moveSystem: MoveSystem
    private let healthSystem = HealthSystem()
    private let spriteSystem: SpriteSystem
    private let timerSystem: TimerSystem

    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        moveSystem = MoveSystem(gameEngine: gameEngine)
        spriteSystem = SpriteSystem(gameEngine: gameEngine)
        timerSystem = TimerSystem(gameEngine: gameEngine)
        systems.append(contentsOf: [manaSystem, moveSystem, healthSystem, spriteSystem, timerSystem])
    }
    
    func update(with deltatime: TimeInterval) {
        moveSystem.update(deltaTime: deltatime)
        timerSystem.update(deltaTime: deltatime)
    }
    
    func addComponents(foundIn entity: GKEntity) {
        systems.forEach { system in
            system.addComponent(foundIn: entity)
        }
    }
    
    func removeComponents(foundIn entity: GKEntity) {
        systems.forEach { system in
            system.removeComponent(foundIn: entity)
        }
    }

    func minusHealthPoints(for entity: GKEntity) -> Int? {
        return healthSystem.minusHealthPoints(for: entity)
    }
}
