//
//  GameEngineFacade.swift
//  GameOfRunes
//
//  Created by Andy on 11/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

protocol GameEngineFacade {
    // Specifically for SpriteKit's contact detection
    var contactDelegate: ContactDelegate { get }
    var metadata: GameMetaData { get }

    func update(with deltaTime: TimeInterval)
    func startNextSpawnWave()
    func updateSelectedPowerUp(powerUpType: PowerUpType?)
    func activatePowerUp(at position: CGPoint, with size: CGSize?)
    func gestureActivated(gesture: CustomGesture)
    func addPlayerEntity(healthNode: HealthBarNode, manaNode: ManaBarNode, scoreNode: ScoreNode)
    func addTimerEntity(timerNode: SKLabelNode, initialTimerValue: TimeInterval)
    func addEndPointEntity(node: SKSpriteNode, team: Team)
}
