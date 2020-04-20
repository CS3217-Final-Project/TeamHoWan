//
//  MultiplayerRemoteGameEngine.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class MultiplayerRemoteGameEngine: GameEngine {
    private let network: NetworkInterface = FirebaseNetwork()
    private let roomId: String
    private let uid: String
    private var uuidEnemyMapping: [String: Entity] = [:]
    
    init(roomId: String, uid: String, stage: Stage, avatar: Avatar, renderNode: RootRenderNode) {
        self.roomId = roomId
        self.uid = uid
        
        super.init(stage: stage, avatar: avatar, renderNode: renderNode)

        network.observeEnemy(roomId: roomId, uid: uid, { [weak self] enemies in self?.syncEnemies(enemies) }, { _ in })
        network.observeMetadata(roomId: roomId, uid: uid, { [weak self] metadata in self?.syncMetadata(metadata) }, { _ in })
        network.observePowerUp(roomId: roomId, uid: uid, { [weak self] powerUp in self?.activatePowerUp(powerUp) }, { _ in })
    }
    
    private func syncEnemies(_ enemies: [EnemyModel]) {
        Set(uuidEnemyMapping.keys).symmetricDifference(enemies.map({ enemy in enemy.uuid })).forEach { uuid in
            guard let enemy = uuidEnemyMapping[uuid] else {
                return
            }

            uuidEnemyMapping[uuid] = nil
            remove(enemy)
        }
        
        for enemy in enemies where uuidEnemyMapping[enemy.uuid] == nil {
            let newEnemy = EnemyEntity(enemyType: enemy.enemyType, gameEngine: self)
            uuidEnemyMapping[enemy.uuid] = newEnemy
            setGesture(for: newEnemy, using: enemy.gestureType)
            add(newEnemy)
        }
        
        for enemy in enemies {
            let enemyEntity = uuidEnemyMapping[enemy.uuid]
            enemyEntity?.component(ofType: SpriteComponent.self)?.node.position = enemy.position
            enemyEntity?.component(ofType: MoveComponent.self)?.cgPosition = enemy.position
        }
    }
    
    private func syncMetadata(_ metadata: MetadataModel) {
        guard let playerEntity = playerEntity else {
            return
        }
        
        playerEntity.component(ofType: HealthComponent.self)?.healthPoints = metadata.playerHealth
        playerEntity.component(ofType: ManaComponent.self)?.manaPoints = metadata.playerMana
    }
    
    private func activatePowerUp(_ powerUp: PowerUpModel) {
        metadata.selectedPowerUp = powerUp.powerUpType
        activatePowerUp(at: powerUp.position, with: powerUp.size)
    }
}
