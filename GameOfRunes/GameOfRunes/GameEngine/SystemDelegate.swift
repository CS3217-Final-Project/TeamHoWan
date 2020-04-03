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
    var timerSystem: TimerSystem? {
        systems[.timerComponent] as? TimerSystem
    }
    var powerUpSystem: PowerUpSystem? {
        systems[.powerUpComponent] as? PowerUpSystem
    }

    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        systems[.healthComponent] = HealthSystem()
        systems[.scoreComponent] = ScoreSystem()
        systems[.manaComponent] = ManaSystem(gameEngine: gameEngine)
        systems[.moveComponent] = MoveSystem(gameEngine: gameEngine)
        systems[.spriteComponent] = SpriteSystem(gameEngine: gameEngine)
        systems[.labelComponent] = LabelSystem(gameEngine: gameEngine)
        systems[.playerComponent] = PlayerSystem(gameEngine: gameEngine)
        systems[.timerComponent] = TimerSystem(gameEngine: gameEngine)
        systems[.powerUpComponent] = PowerUpSystem(gameEngine: gameEngine)
        systems[.attractionEntitiesComponent] = AttractionEntitiesSystem(gameEngine: gameEngine)
        systems[.gestureEntityComponent] = GestureEntitySystem(gameEngine: gameEngine)
    }
    
    func update(with deltatime: TimeInterval) {
        systems[.moveComponent]?.update(deltaTime: deltatime)
        systems[.playerComponent]?.update(deltaTime: deltatime)
        systems[.timerComponent]?.update(deltaTime: deltatime)
    }
    
    func addComponents(foundIn entity: Entity) {
        systems.values.forEach { system in
            system.addComponent(foundIn: entity)
        }
    }
    
    func removeComponents(foundIn entity: Entity) {
        systems.values.forEach { system in
            system.removeComponent(foundIn: entity)
        }
    }
    
    func removeComponent(_ component: Component) {
        systems[component.type]?.removeComponent(component)
    }

    func minusHealthPoints(for entity: Entity) -> Int? {
        healthSystem?.minusHealthPoints(for: entity)
    }

    func increaseMana(by manaPoint: Int, for entity: Entity) {
        manaSystem?.increaseMana(by: manaPoint, for: entity)
    }
    
    func dropMana(at entity: Entity) {
        manaSystem?.dropMana(at: entity)
    }
    
    func getMana(for entity: Entity) -> Int? {
        manaSystem?.getMana(for: entity)
    }
    
    func changeMovementSpeed(for entity: Entity, to speed: Float, duration: TimeInterval) {
        moveSystem?.changeMovementSpeed(for: entity, to: speed, duration: duration)
    }
    
    func changeAnimationSpeed(for entity: Entity, duration: TimeInterval, to speed: Float, animationNodeKey: String) {
        spriteSystem?.changeAnimationSpeed(for: entity, duration: duration, to: speed,
                                           animationNodeKey: animationNodeKey)
    }
    
    func addScore(by points: Int, multiplier: Double, for entity: Entity) {
        scoreSystem?.addScore(by: points, multiplier: multiplier, for: entity)
    }
    
    func addMultiKillScore(count: Int, for entity: Entity) {
        if count >= 5 {
            addScore(by: GameConfig.Score.pentaKillScore, multiplier: 1, for: entity)
        } else if count >= 3 {
            addScore(by: GameConfig.Score.tripleKillScore, multiplier: 1, for: entity)
        }
    }
    
    func runFadingAnimation(_ entity: Entity) {
        spriteSystem?.runFadingAnimation(entity)
    }
    
    func setLabel(_ entity: Entity, label: String) {
        labelSystem?.setLabel(entity: entity, label: label)
    }
    
    func decreaseLabelOpacity(_ entity: Entity) {
        labelSystem?.decreaseLabelOpacity(entity)
    }
    
    func incrementLabelIntegerValue(_ entity: Entity) {
        labelSystem?.incrementLabelIntegerValue(entity)
        timerSystem?.resetTimer(entity)
    }
    
    func incrementMultiplier(_ entity: Entity) {
        scoreSystem?.incrementMultiplier(for: entity)
    }
    
    func activatePowerUp(at position: CGPoint, with size: CGSize) {
        powerUpSystem?.activatePowerUp(at: position, with: size)
    }
}
