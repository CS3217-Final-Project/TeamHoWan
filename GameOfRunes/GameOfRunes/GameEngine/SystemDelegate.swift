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
    var moveSystem: MoveSystem? {
        systems[.moveComponent] as? MoveSystem
    }
    var spriteSystem: SpriteSystem? {
        systems[.spriteComponent] as? SpriteSystem
    }
    var scoreSystem: ScoreSystem? {
        systems[.scoreComponent] as? ScoreSystem
    }
    var labelSystem: LabelSystem? {
        systems[.labelComponent] as? LabelSystem
    }

    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        systems[.healthComponent] = HealthSystem()
        systems[.manaComponent] = ManaSystem(gameEngine: gameEngine)
        systems[.moveComponent] = MoveSystem(gameEngine: gameEngine)
        systems[.spriteComponent] = SpriteSystem(gameEngine: gameEngine)
        systems[.labelComponent] = LabelSystem(gameEngine: gameEngine)
        systems[.playerComponent] = PlayerSystem(gameEngine: gameEngine)
        systems[.timerComponent] = TimerSystem(gameEngine: gameEngine)
        systems[.scoreComponent] = ScoreSystem()
    }
    
    func update(with deltatime: TimeInterval) {
        systems[.moveComponent]?.update(deltaTime: deltatime)
        systems[.playerComponent]?.update(deltaTime: deltatime)
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
    
    func removeComponent(_ component: Component) {
        systems[component.type]?.removeComponent(component)
    }

    func minusHealthPoints(for entity: GKEntity) -> Int? {
        healthSystem?.minusHealthPoints(for: entity)
    }

    func increaseMana(by manaPoint: Int, for entity: GKEntity) {
        manaSystem?.increaseMana(by: manaPoint, for: entity)
    }
    
    func dropMana(at entity: GKEntity) {
        manaSystem?.dropMana(at: entity)
    }
    
    func getMana(for entity: GKEntity) -> Int? {
        manaSystem?.getMana(for: entity)
    }
    
    func stopMovement(for entity: Entity, duration: TimeInterval) {
        moveSystem?.stopMovementForDuration(for: entity, duration: duration)
    }
    
    func stopAnimation(for entity: Entity, duration: TimeInterval, animationNodeKey: String) {
        spriteSystem?.stopAnimationForDuration(for: entity, duration: duration, animationNodeKey: animationNodeKey)
    }
    
    func addScore(by points: Int, for entity: Entity) {
        scoreSystem?.addScore(by: points, for: entity)
    }
    
    func addMultiKillScore(count: Int, for entity: Entity) {
        var score = 0
        if count >= 5 {
            score = 50
        } else if count >= 3 {
            score = 30
        }
        addScore(by: score, for: entity)
    }
    
    func runFadingAnimation(_ entity: Entity) {
        spriteSystem?.runFadingAnimation(entity)
    }
    
    func setLabel(_ entity: Entity, label: String) {
        labelSystem?.setLabel(entity: entity, label: label)
    }
}
