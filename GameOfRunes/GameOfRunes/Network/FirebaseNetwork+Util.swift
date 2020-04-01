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
        var random: String = String(Int.random(in: 0 ..< 1000000))
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
        let isHost = description[FirebaseValues.rooms_players_isHost] as? Bool ?? FirebaseValues.defaultFalse
        let uid = description[FirebaseValues.rooms_players_uid] as? String ?? FirebaseValues.defaultEmptyString
        let name = description[FirebaseValues.rooms_players_name] as? String ?? FirebaseValues.defaultName
        let isReady = description[FirebaseValues.rooms_players_isReady] as? Bool ?? FirebaseValues.defaultFalse
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
        let roomId = dict[FirebaseValues.rooms_roomId] as? String ?? FirebaseValues.defaultEmptyString
        let isOpen = dict[FirebaseValues.rooms_isOpen] as? Bool ?? FirebaseValues.defaultFalse
        let players = dict[FirebaseValues.rooms_players_name] as? [String: AnyObject] ?? [:]
        
        let room = RoomModel(roomId: roomId, isOpen: isOpen)
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
            FirebaseValues.rooms_players_isHost: isHost as AnyObject,
            FirebaseValues.rooms_players_uid: uid as AnyObject,
            FirebaseValues.rooms_players_name: name as AnyObject,
            FirebaseValues.rooms_players_isReady: isReady as AnyObject
        ]
        return playerDict
    }
}
