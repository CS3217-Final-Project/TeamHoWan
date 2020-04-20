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
    
    override func cleanUpPowerUp() {}
    
    private func syncEnemies(_ enemies: [EnemyModel]) {
        guard let size = rootRenderNode?.size else {
            return
        }
        
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
            let position = CGPoint(x: enemy.position.x * size.width, y: enemy.position.y * size.height)
            
            enemyEntity?.component(ofType: SpriteComponent.self)?.node.position = position
            enemyEntity?.component(ofType: MoveComponent.self)?.cgPosition = position
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
        guard let playArea = rootRenderNode?.size else {
            return
        }
        
        metadata.selectedPowerUp = powerUp.powerUpType
        let position = CGPoint(x: powerUp.position.x * playArea.width, y: powerUp.position.y * playArea.height)
        activatePowerUp(at: position, with: powerUp.size)
    }
}
