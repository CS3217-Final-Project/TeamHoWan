//
//  SpawnSystem.swift
//  GameOfRunes
//
//  Created by Brian Yen on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

/**
 This class deals with the spawning of units. Level data is accessed via
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
            !gameMetaData.stageWaves.isEmpty else {
            return
        }

        let enemySpawnWave = gameMetaData.stageWaves.removeFirstSpawnWave()
        spawnEnemyWave(enemySpawnWave)
        self.timeTillNextSpawn = gameMetaData.levelSpawnInterval
    }
    
    func spawnPlayerUnitWave() {
        (0..<GameConfig.GamePlayScene.numLanes).forEach { laneIndex in
            spawnPlayerUnit(at: laneIndex)
        }
    }
    
    private func spawnPlayerUnit(at laneIndex: Int) {
        let playerUnitEntity = PlayerUnitEntity(gameEngine: gameEngine)
        
        guard let spriteComponent = playerUnitEntity.component(ofType: SpriteComponent.self),
            let playerEndPoint = gameEngine?.gameScene?.playerEndPoint else {
                return
        }
        
        spriteComponent.node.position = GameConfig.GamePlayScene.calculateHorizontallyDistributedPoints(
            width: playerEndPoint.size.width,
            laneIndex: laneIndex,
            totalPoints: GameConfig.GamePlayScene.numLanes,
            yPosition: playerEndPoint.position.y
        )

        gameEngine?.add(playerUnitEntity)
    }

    private func spawnEnemyWave(_ enemyWave: [EnemyType?]) {
        enemyWave.enumerated().forEach { laneIndex, enemyType in
            spawnEnemy(at: laneIndex, enemyType: enemyType)
        }
    }

    /**
     Creates the `EnemyEntity` at the correct spawn location (determined by the
     `laneIndex` and adds it to `GameEngine`.
     */
    private func spawnEnemy(at laneIndex: Int, enemyType: EnemyType?) {
        // No need to spawn enemy if enemyType is nil (i.e. lane is empty)
        guard let enemyType = enemyType, let gameEngine = gameEngine else {
            return
        }

        let enemyEntity = EnemyEntity(enemyType: enemyType, gameEngine: gameEngine)
        guard let spriteComponent = enemyEntity.component(ofType: SpriteComponent.self),
            let sceneSize = gameEngine.gameScene?.size else {
                return
        }

        spriteComponent.node.position = GameConfig.GamePlayScene.calculateHorizontallyDistributedPoints(
            width: sceneSize.width,
            laneIndex: laneIndex,
            totalPoints: GameConfig.GamePlayScene.numLanes,
            yPosition: sceneSize.height - GameConfig.GamePlayScene.verticalOffSet
        )

        gameEngine.add(enemyEntity)
        gameEngine.metadata.numEnemiesOnField += 1
    }
}
