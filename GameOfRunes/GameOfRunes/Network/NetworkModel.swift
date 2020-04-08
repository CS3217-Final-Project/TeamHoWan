//
//  PlayerModel.swift
//  GameOfRunes
//
//  Created by Andy on 1/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

/**
 Model representing a Player on the network.
 */
class PlayerModel: Codable {
    var uid: String
    var name: String
    var isHost: Bool
    var isReady: Bool
    var powerUpActivated: PowerUpModel?
    var monsters: [MonsterModel]?
    
    init(uid: String, name: String = FirebaseKeys.defaultName, isHost: Bool,
         isReady: Bool = false, powerUp: PowerUpModel? = nil, monsters: [MonsterModel]? = nil) {
        self.uid = uid
        self.name = name
        self.isHost = isHost
        self.isReady = isReady
        self.powerUpActivated = powerUp
        self.monsters = monsters
    }
}

/**
 Model representing a Room on the network. Contains a list of `PlayerModel`, together with other properties.
 */
class RoomModel: Codable {
    var roomId: String
    var isOpen: Bool
    var hasStarted: Bool
    var gameCreated: Bool
    var players: [PlayerModel] = []
    
    init(roomId: String = "", isOpen: Bool = false, hasStarted: Bool = false, gameCreated: Bool = false) {
        self.roomId = roomId
        self.isOpen = isOpen
        self.hasStarted = hasStarted
        self.gameCreated = gameCreated
    }
    
    func addPlayer(_ player: PlayerModel) {
        players.append(player)
    }
    
    func toggleRoomOpen() {
        isOpen.toggle()
    }
    
    func toString() -> String {
        "roomId: \(self.roomId)\nplayers: \(self.players)\nroomIsOpen: \(self.isOpen)"
    }
}

/**
 Model representing a Monsters on the network.
 Conforms to `Codable` so that it can be encoded before being sent over the network and then subsequently decoded.
 */
class MonsterModel: Codable {
    var uuid: String
    var enemyType: EnemyType
    var position: CGPoint
    var gestureType: CustomGesture
    
    init(enemyType: EnemyType, position: CGPoint, gestureType: CustomGesture, uuid: String) {
        self.uuid = uuid
        self.enemyType = enemyType
        self.position = position
        self.gestureType = gestureType
    }
}

/**
 Model representing Power Ups on the network.
 Conforms to `Codable` so that it can be encoded before being sent over the network and then subsequently decoded.
 */
class PowerUpModel: Codable {
    var powerUpType: PowerUpType
    var position: CGPoint?
    var size: CGSize?
    
    init(powerUpType: PowerUpType, position: CGPoint? = nil, size: CGSize? = nil) {
        self.powerUpType = powerUpType
        self.position = position
        self.size = size
    }
}
