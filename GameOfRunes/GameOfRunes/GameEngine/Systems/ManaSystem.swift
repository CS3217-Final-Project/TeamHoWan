//
//  ManaSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class ManaSystem: GKComponentSystem<ManaComponent>, System {
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        super.init(componentClass: ManaComponent.self)
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? ManaComponent else {
            return
        }

        super.removeComponent(component)
    }
    
    func increaseMana(by manaPoints: Int, for entity: GKEntity) {
        guard let entityManaComponent = entity.component(ofType: ManaComponent.self) else {
            return
        }
        
        entityManaComponent.manaPoints = max(0, entityManaComponent.manaPoints + manaPoints)
    }
    
    func getMana(for entity: GKEntity) -> Int? {
        entity.component(ofType: ManaComponent.self)?.manaPoints
    }
}

/** Extension for the ManaSystem to deal with DroppedMana-related events and logic. */
extension ManaSystem {
    /** Function called whenever a monster is killed and mana can be dropped. */
    func dropMana(at enemyEntity: GKEntity) {
        guard shouldDropMana() else {
            return
        }

        guard let enemySpriteComponent = enemyEntity.component(ofType: SpriteComponent.self),
            let gameEngine = gameEngine else {
            return
        }

        let position = enemySpriteComponent.node.position
        let manaPoints = getRandomManaPoints()
        let droppedManaEntity = DroppedManaEntity(position: position, manaPoints: manaPoints,
                                                  gameEngine: gameEngine)
        gameEngine.add(droppedManaEntity)
    }

    /**
     Checks if the Mana should be dropped.
     This method utilises a uniform distribution to ensure
     that the Mana is only dropped with probability determined
     by the value `GameplayConfiguration.Mana.manaDropProbaility`
     */
    private func shouldDropMana() -> Bool {
        let randNum = CGFloat.random(in: 0.0...1.0)
        return randNum <= GameConfig.Mana.manaDropProbability
    }

    /**
     Obtains a randomised value for the mana points associated with
     the `DroppedManaEntity` to be created. The upper and lower
     bounds for the mana points can be set in `GameplayConfiguration`
     */
    private func getRandomManaPoints() -> Int {
        let lowerBound = GameConfig.Mana.manaMinValue
        let upperBound = GameConfig.Mana.manaMaxValue
        return Int.random(in: lowerBound...upperBound)
    }
}
