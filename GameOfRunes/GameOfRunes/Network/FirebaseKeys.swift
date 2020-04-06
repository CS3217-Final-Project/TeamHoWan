//
//  FirebaseKeys.swift
//  GameOfRunes
//
//  Created by Andy on 1/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

struct FirebaseKeys {
    static let defaultFalse = false
    static let defaultName = "Anonymous"
    static let defaultEmptyString = ""
    
    // Room keys
    static let rooms = "rooms"
    static let rooms_roomId = "roomId"
    static let rooms_isOpen = "is_open"
    static let rooms_hasStarted = "has_started"
    static let rooms_gameCreated = "game_created"
    static let rooms_players = "players"
    static let rooms_players_isReady = "is_ready"
    static let rooms_players_isHost = "is_host"
    static let rooms_players_uid = "uid"
    static let rooms_players_name = "name"
    static let rooms_offer = "offer"
    static let rooms_answer = "asnwer"
    
    /// Joins keys with the required (firebase) separator
    /// - Parameters:
    ///     - forKeys: an array of keys
    /// - Returns:
    ///     - a String representing the joined keys
    static func joinKeys(_ keys: [String]) -> String {
        var finalReference = ""
        for key in keys {
            finalReference = "\(finalReference)/\(key)"
        }
        return finalReference
    }
}
