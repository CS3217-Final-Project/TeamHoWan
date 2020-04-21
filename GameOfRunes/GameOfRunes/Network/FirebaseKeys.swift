//
//  FirebaseKeys.swift
//  GameOfRunes
//
//  Created by Andy on 1/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

enum FirebaseKeys {
    static let defaultBool = false
    static let defaultString = ""
    static let defaultAvatar = Avatar.elementalWizard.name
    
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
    static let rooms_players_avatar = "avatar"
    static let rooms_players_didLose = "did_lose"
    static let rooms_players_powerUp = "powerUp"
    static let rooms_players_monsters = "monsters"
    static let rooms_players_metadata = "metadata"

    /// Joins keys with the required (firebase) separator
    /// - Parameters:
    ///     - forKeys: an array of keys
    /// - Returns:
    ///     - a String representing the joined keys
    static func joinKeys(_ keys: String...) -> String {
        keys.joined(separator: "/")
    }
}
