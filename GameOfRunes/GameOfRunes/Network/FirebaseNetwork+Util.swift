//
//  FirebaseNetwork+Util.swift
//  GameOfRunes
//
//  Created by Andy on 1/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation

extension FirebaseNetwork {
    /**
     Generates a random 5 digit number for roomId. This can generate duplicates and collisions can occur.
     */
    func generateRandomId() -> String {
        var random = String(Int.random(in: 0 ..< 1_000_000))
        while random.count < 6 {
            random = "0\(random)"
        }
        
        return random
    }
    
    /**
     Conversion from firebase dictionary to a PlayerModel
     - Parameters:
     - forUid: the uid of the player
     - forDescription: the player's details
     - Returns:
     - PlayerModel object
     */
    func firebasePlayerModelFactory(forUid uid: String,
                                    forDescription playerDescription: AnyObject) -> PlayerModel {
        guard let description = playerDescription as? [String: AnyObject] else {
            return PlayerModel(uid: uid, isHost: false)
        }
        let isHost = description[FirebaseKeys.rooms_players_isHost] as? Bool ?? FirebaseKeys.defaultFalse
        let uid = description[FirebaseKeys.rooms_players_uid] as? String ?? FirebaseKeys.defaultEmptyString
        let name = description[FirebaseKeys.rooms_players_name] as? String ?? FirebaseKeys.defaultName
        let isReady = description[FirebaseKeys.rooms_players_isReady] as? Bool ?? FirebaseKeys.defaultFalse
        return PlayerModel(uid: uid, name: name, isHost: isHost, isReady: isReady)
    }
    
    /**
     Conversion to RoomModel object from a firebase dictionary
     - Parameters:
     - forDict: the dictionary fetched from Firebase
     - Returns:
     - a RoomModel object
     */
    func firebaseRoomModelFactory(forDict dict: [String: AnyObject]) -> RoomModel {
        let roomId = dict[FirebaseKeys.rooms_roomId] as? String ?? FirebaseKeys.defaultEmptyString
        let isOpen = dict[FirebaseKeys.rooms_isOpen] as? Bool ?? FirebaseKeys.defaultFalse
        let hasStarted = dict[FirebaseKeys.rooms_hasStarted] as? Bool ?? FirebaseKeys.defaultFalse
        let gameCreated = dict[FirebaseKeys.rooms_gameCreated] as? Bool ?? FirebaseKeys.defaultFalse
        let players = dict[FirebaseKeys.rooms_players_name] as? [String: AnyObject] ?? [:]
        
        let room = RoomModel(roomId: roomId, isOpen: isOpen, hasStarted: hasStarted, gameCreated: gameCreated)
        for (playerUid, playerDescription) in players {
            room.addPlayer(firebasePlayerModelFactory(forUid: playerUid, forDescription: playerDescription))
        }
        return room
    }
    
    /**
     Creates a dictionary which translates to the firebase database reference for a player description inside a room
     - Parameters:
     - uid: uid of the player
     - name: name of the player
     - isHost: whether user is host
     - isReady: whether the player is ready
     - Returns: a dictionary representing the player object, ready to be inserted into firebase
     */
    func createPlayerDict(uid: String, name: String, isHost: Bool, isReady: Bool) -> [String: AnyObject] {
        let playerDict: [String: AnyObject] = [
            FirebaseKeys.rooms_players_isHost: isHost as AnyObject,
            FirebaseKeys.rooms_players_uid: uid as AnyObject,
            FirebaseKeys.rooms_players_name: name as AnyObject,
            FirebaseKeys.rooms_players_isReady: isReady as AnyObject
        ]
        return playerDict
    }
}
