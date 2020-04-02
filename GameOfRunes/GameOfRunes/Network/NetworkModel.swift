//
//  PlayerModel.swift
//  GameOfRunes
//
//  Created by Andy on 1/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

/**
Model representing a Player on the network.
 */
class PlayerModel {
    var uid: String = ""
    var name: String = "Anonymous"
    var isHost: Bool
    var isReady: Bool = false

    init(uid: String, isHost: Bool) {
        self.uid = uid
        self.isHost = isHost
    }
    
    init(uid: String, name: String, isHost: Bool, isReady: Bool) {
        self.uid = uid
        self.name = name
        self.isHost = isHost
        self.isReady = isReady
    }
}

/**
 Model representing a Room on the network. Contains a list of `PlayerModel`, together with other properties.
 */
class RoomModel {
    var roomId: String = ""
    var isOpen: Bool = false
    var hasStarted: Bool = false
    var gameCreated: Bool = false
    var players: [PlayerModel] = []

    init(roomId: String, isOpen: Bool) {
        self.roomId = roomId
        self.isOpen = isOpen
    }
    
    init(roomId: String, isOpen: Bool, hasStarted: Bool, gameCreated: Bool) {
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
        return "roomId: \(self.roomId)\nplayers: \(self.players)\nroomIsOpen: \(self.isOpen)"
    }
}
