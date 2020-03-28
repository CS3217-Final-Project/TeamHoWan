//
//  SpawnSystem.swift
//  GameOfRunes
//
//  Created by Brian Yen on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class SpawnDelegate {
    private weak var gameEngine: GameEngine?
    private weak var gameMetaData: GameMetaData?
    private var timeSinceLastUpdate: TimeInterval

    init(gameEngine: GameEngine, gameMetaData: GameMetaData) {
        self.gameEngine = gameEngine
        self.gameMetaData = gameMetaData
        self.timeSinceLastUpdate = 0
    }

    func update(with deltatime: TimeInterval) {
        guard let gameMetaData = gameMetaData else {
            return
        }

        // Check that there are still waves left
        guard !gameMetaData.levelWaves.isEmpty else {
            return
        }

        //TODO: spawn next wave when playing field is empty

        self.timeSinceLastUpdate += deltatime
        if self.timeSinceLastUpdate >= gameMetaData.levelSpawnInterval {
            self.timeSinceLastUpdate -= gameMetaData.levelSpawnInterval
            let enemySpawnWave = gameMetaData.levelWaves.removeFirstSpawnWave()
            spawnEnemyWave(enemySpawnWave)
        }
    }

    private func spawnEnemyWave(_ enemyWave: [EnemyType]) {
        for (laneIndex, enemyType) in enemyWave.enumerated() {
            spawnEnemy(at: laneIndex, enemyType: enemyType)
        }
    }

    private func spawnEnemy(at laneIndex: Int, enemyType: EnemyType) {
        // No need to spawn enemy if type is `.none`
        guard enemyType != .none else {
            return
        }

        guard let gameEngine = gameEngine else {
            return
        }

        let enemyEntity = EnemyEntity(enemyType: enemyType, gameEngine: gameEngine)
        if let spriteComponent = enemyEntity.component(ofType: SpriteComponent.self),
            let sceneSize = gameEngine.gameScene?.size {

            let xPositionNumerator = 2 * laneIndex + 1
            let xPositionDenominator = 2 * GameConfig.GamePlayScene.numLanes
            let xPositionRatio: Double = Double(xPositionNumerator) / Double(xPositionDenominator)
            spriteComponent.node.position = CGPoint(x: Double(sceneSize.width) * xPositionRatio,
                                                    y: Double(sceneSize.height - 100))
            spriteComponent.node.size = spriteComponent.node.size.scaleTo(width: sceneSize.width / 6)
        }

        guard let gestureEntity = enemyEntity.gestureEntity else {
            return
        }

        gameEngine.add(enemyEntity)
        gameEngine.add(gestureEntity)
    }
}
