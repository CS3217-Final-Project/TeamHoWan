//
//  SystemDelegate.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class SystemDelegate {
    private weak var gameEngine: GameEngine?
    private var systems = [ComponentType: System]()
    var healthSystem: HealthSystem? {
        systems[.healthComponent] as? HealthSystem
    }
    var manaSystem: ManaSystem? {
        systems[.manaComponent] as? ManaSystem
    }
    var droppedManaResponder: DroppedManaResponderType? {
        systems[.manaComponent] as? ManaSystem
    }

    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        systems[.healthComponent] = HealthSystem()
        systems[.manaComponent] = ManaSystem(gameEngine: gameEngine)
        systems[.moveComponent] = MoveSystem(gameEngine: gameEngine)
        systems[.spriteComponent] = SpriteSystem(gameEngine: gameEngine)
        systems[.timerComponent] = TimerSystem(gameEngine: gameEngine)
    }
    
    func update(with deltatime: TimeInterval) {
        systems[.moveComponent]?.update(deltaTime: deltatime)
        systems[.timerComponent]?.update(deltaTime: deltatime)
    }
    
    func addComponents(foundIn entity: GKEntity) {
        systems.values.forEach { system in
            system.addComponent(foundIn: entity)
        }
    }
    
    func removeComponents(foundIn entity: GKEntity) {
        systems.values.forEach { system in
            system.removeComponent(foundIn: entity)
        }
    }
    
    func remove(_ component: Component) {
        systems[component.type]?.removeComponent(component)
    }

    func minusHealthPoints(for entity: GKEntity) -> Int? {
        return healthSystem?.minusHealthPoints(for: entity)
    }

    func increaseMana(by manaPoint: Int, for entity: GKEntity) {
        manaSystem?.increaseMana(by: manaPoint, for: entity)
    }
    
    func dropMana(at entity: GKEntity) {
        manaSystem?.dropMana(at: entity)
    }
}
