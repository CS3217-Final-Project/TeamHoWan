//
//  SystemDelegate.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

/** Handles all system related logic */
extension GameEngine {
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
    var gestureEntitySystem: GestureEntitySystem? {
        systems[.gestureEntityComponent] as? GestureEntitySystem
    }
    var playerSystem: PlayerSystem? {
        systems[.playerComponent] as? PlayerSystem
    }
    
    func updateSystems(with deltatime: TimeInterval) {
        moveSystem?.update(deltaTime: deltatime)
        gestureEntitySystem?.update(deltaTime: deltatime)
        playerSystem?.update(deltaTime: deltatime)
        timerSystem?.update(deltaTime: deltatime)
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
    
    func addComponent(_ component: Component) {
        systems[component.type]?.addComponent(component)
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
    }
    
    func resetTimer(_ entity: Entity) {
        timerSystem?.resetTimer(entity)
    }
    
    func incrementCombo(_ entity: Entity) {
        incrementLabelIntegerValue(entity)
        resetTimer(entity)
    }
    
    func incrementMultiplier(_ entity: Entity) {
        scoreSystem?.incrementMultiplier(for: entity)
    }
    
    func setInitialGesture(for entity: Entity) {
        gestureEntitySystem?.setInitialGesture(for: entity)
    }
    
    func setGesture(for entity: Entity, using gesture: CustomGesture?) {
        gestureEntitySystem?.setGesture(for: entity, using: gesture)
    }
    
    func activateInvincibleEndPoint(for entity: Entity) {
        spriteSystem?.activateInvincibleEndPoint(for: entity)
    }
    
    func deactivateInvincibleEndPoint(for entity: Entity) {
        spriteSystem?.deactivateInvincibleEndPoint(for: entity)
    }
}
