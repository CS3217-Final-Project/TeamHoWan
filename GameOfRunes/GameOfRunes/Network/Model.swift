//
//  UserModel.swift
//  GameOfRunes
//
//  Created by Andy on 1/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

/**
Model representing a Player on the network.
 */
class UserModel {
    var uid: String = ""
    var name: String = "Anonymous"
    var isHost: Bool
    var isReady: Bool = false

    init(uid: String, isHost: Bool) {
        self.uid = uid
        self.isHost = isHost
    }
    
    init(uid: String, name: String, isHost: Bool) {
        self.uid = uid
        self.name = name
        self.isHost = isHost
    }
}

/**
 Model representing a Room on the network. Contains a list of `UserModel`, together with other properties.
 */
class RoomModel {
    var id: String = ""
    var players: [UserModel] = []
    var isOpen: Bool = false
    
    init(id: String, isOpen: Bool) {
        self.id = id
        self.isOpen = isOpen
    }
    
    func addPlayer(_ player: UserModel) {
        players.append(player)
    }
    
    func closeRoom() {
        isOpen = false
    }
    
    func toString() -> String {
        return "id: \(self.id)\nplayers: \(self.players)\nroomIsOpen: \(self.isOpen)"
    }
}
