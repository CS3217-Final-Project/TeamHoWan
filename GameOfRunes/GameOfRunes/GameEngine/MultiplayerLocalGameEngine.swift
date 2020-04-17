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
    private var uuidMonsterMapping: [String: Entity] = [:]
    private var monsterUuidMapping: [Entity: String] = [:]
    
    init(roomId: String, uid: String, stage: Stage, avatar: Avatar, renderNode: RootRenderNode) {
        self.roomId = roomId
        self.uid = uid
        
        super.init(stage: stage, avatar: avatar, renderNode: renderNode)
    }
    
    override func add(_ entity: Entity) -> Bool {
        let isAdded = super.add(entity)
        
        guard isAdded else {
            return false
        }
        
        guard entity.type == .enemyEntity else {
            return isAdded
        }
        
        var newUuid = Util.generateUuid()
        
        while uuidMonsterMapping[newUuid] != nil {
            newUuid = Util.generateUuid()
        }
        
        uuidMonsterMapping[newUuid] = entity
        monsterUuidMapping[entity] = newUuid
        return isAdded
    }
    
    override func update(with deltaTime: TimeInterval) {
        let monstersRemoved = toRemoveEntities.filter { entity in entity.type == .enemyEntity }
        
        if !monstersRemoved.isEmpty {
            let monstersLeft = Set(uuidMonsterMapping.values).symmetricDifference(monstersRemoved)
            monstersLeft.forEach { entity in
                guard let uuid = monsterUuidMapping.removeValue(forKey: entity) else {
                    return
                }
                
                uuidMonsterMapping.removeValue(forKey: uuid)
            }
            
            pushMonstersToNetwork()
        }
        
        super.update(with: deltaTime)
    }
    
    override func activatePowerUp(at position: CGPoint, with size: CGSize? = nil) {
        pushMonstersToNetwork()
        pushMetadataToNetwork()
        pushPowerUpToNetwork(at: position, with: size)
        super.activatePowerUp(at: position, with: size)
    }
    
    private func pushMonstersToNetwork() {
        let monsterModels = Array(entities(for: .enemyEntity).compactMap({ entity in
            MonsterModel(entity, uuid: monsterUuidMapping[entity])
        }))
        
        network.updateMonsters(roomId: roomId, uid: uid, monsters: monsterModels, {}, { _ in })
    }
    
    private func pushMetadataToNetwork() {
        let metadataModel = MetadataModel(metadata)
        network.updateMetadata(roomId: roomId, uid: uid, metadata: metadataModel, {}, { _ in })
    }
    
    private func pushPowerUpToNetwork(at position: CGPoint, with size: CGSize?) {
        let powerUpModel = PowerUpModel(powerUpType: metadata.selectedPowerUp, position: position, size: size)
        network.updatePowerUp(roomId: roomId, uid: uid, powerUp: powerUpModel, {}, { _ in })
    }
}
