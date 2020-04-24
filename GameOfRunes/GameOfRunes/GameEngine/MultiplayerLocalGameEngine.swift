//
//  MultiplayerLocalGameEngine.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class MultiplayerLocalGameEngine: GameEngine {
    private let network: NetworkInterface = FirebaseNetwork()
    private let roomId: String
    private let uid: String
    private var uuidEnemyMapping: [String: Entity] = [:]
    private var enemyUuidMapping: [Entity: String] = [:]
    
    init(roomId: String, uid: String, remotePlayers: [Player],
         stage: Stage, avatar: Avatar, renderNode: RootRenderNode) {
        self.roomId = roomId
        self.uid = uid

        super.init(stage: stage, avatar: avatar, renderNode: renderNode)
        network.observeRoomState(roomId: roomId, onDataChange: { [weak self] room in
                self?.didGameEnd(room: room)
            }, onRoomClose: { [weak self] in
                self?.network.removeObservers()
            }, onError: nil)
        
        for player in remotePlayers {
            network.observeNumberOfEnemiesKilled(roomId: roomId, uid: player.uid,
                                                 onDataChange: { [weak self] count in self?.enemiesKilled(count) },
                                                 onError: nil)
        }
    }
    
    private func enemiesKilled(_ count: Int) {
        guard count >= 2 else {
            return
        }
        spawnDelegate.startNextSpawnWave(tintUnits: true)
    }
    
    override func add(_ entity: Entity) -> Bool {
        let isAdded = super.add(entity)
        
        guard isAdded else {
            return false
        }
        
        guard entity.type == .enemyEntity else {
            return isAdded
        }
        
        var newUuid = UUID().uuidString
        
        while uuidEnemyMapping[newUuid] != nil {
            newUuid = UUID().uuidString
        }
        
        uuidEnemyMapping[newUuid] = entity
        enemyUuidMapping[entity] = newUuid
        pushMonstersToNetwork()
        return isAdded
    }
    
    override func update(with deltaTime: TimeInterval) {
        let monstersRemoved = toRemoveEntities.filter { entity in entity.type == .enemyEntity }
        
        if !monstersRemoved.isEmpty {
            monstersRemoved.forEach { entity in
                guard let uuid = enemyUuidMapping.removeValue(forKey: entity) else {
                    return
                }
                
                uuidEnemyMapping.removeValue(forKey: uuid)
            }
            
            pushMonstersToNetwork()
            pushMonstersKilledToNetwork(monstersRemoved.count)
        }
        
        super.update(with: deltaTime)
    }
    
    override func didGameEnd() {
        if metadata.playerHealth <= 0 {
            network.removeObservers()
            network.updateDidLose(roomId: roomId, uid: uid, didLose: true, completion: nil, onError: nil)
            rootRenderNode?.gameDidEnd(didWin: false, finalScore: metadata.score)
        }
    }
    
    private func didGameEnd(room: RoomModel) {
        var numPlayerLost = 0
        for player in room.players where player.uid != uid && player.didLose {
            numPlayerLost += 1
        }
        
        if numPlayerLost == room.players.count - 1 {
            network.removeObservers()
            rootRenderNode?.gameDidEnd(didWin: true, finalScore: metadata.score)
        }
    }
    
    override func gestureActivated(gesture: CustomGesture) {
        super.gestureActivated(gesture: gesture)
        pushMonstersToNetwork()
    }
    
    override func activatePowerUp(at position: CGPoint, with size: CGSize? = nil) {
        pushMonstersToNetwork()
        pushMetadataToNetwork()
        pushPowerUpToNetwork(at: position, with: size)
        super.activatePowerUp(at: position, with: size)
    }
    
    private func pushMonstersToNetwork() {
        let monsterModels: [EnemyModel] = (entities(for: .enemyEntity).compactMap({ entity in
            guard let playArea = rootRenderNode?.size else {
                return nil
            }
            return EnemyModel(entity, uuid: enemyUuidMapping[entity], playAreaSize: playArea)
        }))
        
        network.updateMonsters(roomId: roomId, uid: uid, monsters: monsterModels, completion: nil, onError: nil)
    }
    
    private func pushMonstersKilledToNetwork(_ count: Int) {
        network.updateNumberOfEnemiesKilled(roomId: roomId, uid: uid, count: count, completion: nil, onError: nil)
    }
    
    private func pushMetadataToNetwork() {
        let metadataModel = MetadataModel(metadata)
        network.updateMetadata(roomId: roomId, uid: uid, metadata: metadataModel, completion: nil, onError: nil)
    }
    
    private func pushPowerUpToNetwork(at position: CGPoint, with size: CGSize?) {
        guard let powerUp = metadata.selectedPowerUp,
            let playArea = rootRenderNode?.size else {
            return
        }
        let powerUpModel = PowerUpModel(powerUpType: powerUp, playAreaSize: playArea, position: position, size: size)
        network.updatePowerUp(roomId: roomId, uid: uid, powerUp: powerUpModel, completion: nil, onError: nil)
    }
}
