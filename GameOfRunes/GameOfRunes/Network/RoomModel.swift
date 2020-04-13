//
//  RoomModel.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

/**
 Model representing a Room on the network. Contains a list of `PlayerModel`, together with other properties.
 */
class RoomModel: Codable {
    let roomId: String
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
        "roomId: \(roomId)\nplayers: \(players)\nroomIsOpen: \(isOpen)"
    }
}
