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
    var players: [PlayerModel] = []
    
    init(roomId: String = "", isOpen: Bool = false, hasStarted: Bool = false) {
        self.roomId = roomId
        self.isOpen = isOpen
        self.hasStarted = hasStarted
    }
    
    func addPlayer(_ player: PlayerModel) {
        players.append(player)
    }
    
    func convertToRoom(with localPlayerUid: String) -> Room {
        var updatedRoom = Room(roomId: roomId)
        
        updatedRoom.isReady = true
        players.forEach { player in
            if !player.isHost {
                updatedRoom.isReady = updatedRoom.isReady && player.isReady
            }
            
            if player.uid == localPlayerUid {
                updatedRoom.localPlayer = player.toPlayer
                updatedRoom.localPlayerIsHost = player.isHost
            } else {
                updatedRoom.remoteplayers.append(player.toPlayer)
            }
        }
        
        updatedRoom.isReady = updatedRoom.isReady && !updatedRoom.remoteplayers.isEmpty
        
        return updatedRoom
    }
}
