//
//  SystemDelegate.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

protocol SystemDelegate: AnyObject {
    func updateSystems(with deltatime: TimeInterval)
    func addComponents(foundIn entity: Entity)
    func removeComponents(foundIn entity: Entity)
    func removeComponent(_ component: Component)
    func minusHealthPoints(for entity: Entity) -> Int?
    func increaseMana(by manaPoint: Int, for entity: Entity)
    func dropMana(at entity: Entity)
    func getMana(for entity: Entity) -> Int?
    func changeMovementSpeed(for entity: Entity, to speed: Float, duration: TimeInterval)
    func changeAnimationSpeed(for entity: Entity, duration: TimeInterval, to speed: Float, animationNodeKey: String)
    func addScore(by points: Int, multiplier: Double, for entity: Entity)
    func addMultiKillScore(count: Int, for entity: Entity)
    func runFadingAnimation(_ entity: Entity)
    func setLabel(_ entity: Entity, label: String)
    func decreaseLabelOpacity(_ entity: Entity)
    func incrementLabelIntegerValue(_ entity: Entity)
    func resetTimer(_ entity: Entity)
    func incrementMultiplier(_ entity: Entity)
    func activatePowerUp(at position: CGPoint, with size: CGSize?)
    func setInitialGesture(for entity: Entity)
    func setGesture(for entity: Entity, using gesture: CustomGesture?)
    func activateInvincibleEndPoint()
    func deactivateInvincibleEndPoint()
}
