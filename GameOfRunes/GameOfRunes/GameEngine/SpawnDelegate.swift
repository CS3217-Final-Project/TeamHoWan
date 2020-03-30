//
//  SpawnSystem.swift
//  GameOfRunes
//
//  Created by Brian Yen on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

/**
 This class deals with the spawning of enemies. Level data is accessed via
 `GameMetaData` and is updated at periodic time intervals.
 */
class SpawnDelegate {
    private weak var gameEngine: GameEngine?
    // TODO: When timer is up, should retrieve this information from GameMetaData
    private var timeTillNextSpawn: TimeInterval

    init(gameEngine: GameEngine, gameMetaData: GameMetaData) {
        self.gameEngine = gameEngine
        self.timeTillNextSpawn = 0
    }

    func update(with deltaTime: TimeInterval) {
        // Send next spawn wave when timer is up
        if self.timeTillNextSpawn <= 0 {
            startNextSpawnWave()
        } else {
            self.timeTillNextSpawn -= deltaTime
        }
    }

    func startNextSpawnWave() {
        // Check that there are still waves left
        guard let gameMetaData = gameEngine?.metadata,
            !gameMetaData.levelWaves.isEmpty else {
            return
        }

        let enemySpawnWave = gameMetaData.levelWaves.removeFirstSpawnWave()
        spawnEnemyWave(enemySpawnWave)
        self.timeTillNextSpawn = gameMetaData.levelSpawnInterval
    }

    private func spawnEnemyWave(_ enemyWave: [EnemyType?]) {
        for (laneIndex, enemyType) in enemyWave.enumerated() {
            spawnEnemy(at: laneIndex, enemyType: enemyType)
        }
    }

    /**
     Creates the `EnemyEntity` at the correct spawn location (determined by the
     `laneIndex` and adds it to `GameEngine`.
     */
    private func spawnEnemy(at laneIndex: Int, enemyType: EnemyType?) {
        // No need to spawn enemy if enemyType is nil (i.e. lane is empty)
        guard let enemyType = enemyType,
            let gameEngine = gameEngine else {
            return
        }

        let gameMetaData = gameEngine.metadata
        let enemyEntity = EnemyEntity(enemyType: enemyType, gameEngine: gameEngine)
        guard let spriteComponent = enemyEntity.component(ofType: SpriteComponent.self),
            let sceneSize = gameEngine.gameScene?.size,
            let gestureEntity = enemyEntity.component(ofType: GestureEntityComponent.self)?.gestureEntity else {
                return
        }

        // Determine spawn location
        let xPositionNumerator = 2 * laneIndex + 1
        let xPositionDenominator = 2 * GameConfig.GamePlayScene.numLanes
        let xPositionRatio = Double(xPositionNumerator) / Double(xPositionDenominator)
        let edgeOffset = GameConfig.GamePlayScene.horizontalOffSet
        let xPosition = (Double(sceneSize.width) - 2 * edgeOffset) * xPositionRatio + edgeOffset
        let yPosition = Double(sceneSize.height) - GameConfig.GamePlayScene.verticalOffSet

        spriteComponent.node.position = CGPoint(x: xPosition,
                                                y: yPosition)

        // Update GameMetaData
        gameMetaData.numEnemiesOnField += 1

        gameEngine.add(enemyEntity)
        gameEngine.add(gestureEntity)
    }
}
