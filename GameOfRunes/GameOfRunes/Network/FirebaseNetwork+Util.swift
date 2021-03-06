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
     Adapter pattern: Conversion from firebase dictionary to a PlayerModel
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
        let isHost = description[FirebaseKeys.rooms_players_isHost] as? Bool ?? FirebaseKeys.defaultBool
        let uid = description[FirebaseKeys.rooms_players_uid] as? String ?? FirebaseKeys.defaultString
        let name = description[FirebaseKeys.rooms_players_name] as? String ?? FirebaseKeys.defaultString
        let avatar = description[FirebaseKeys.rooms_players_avatar] as? String ?? FirebaseKeys.defaultAvatar
        let isReady = description[FirebaseKeys.rooms_players_isReady] as? Bool ?? FirebaseKeys.defaultBool
        let didLose = description[FirebaseKeys.rooms_players_didLose] as? Bool ?? FirebaseKeys.defaultBool
        return PlayerModel(uid: uid, isHost: isHost, name: name, isReady: isReady, avatar: avatar, didLose: didLose)
    }
    
    /**
     Adapter pattern:
     Conversion to RoomModel object from a firebase dictionary
     - Parameters:
     - forDict: the dictionary fetched from Firebase
     - Returns:
     - a RoomModel object
     */
    func firebaseRoomModelFactory(forDict dict: [String: AnyObject]) -> RoomModel {
        let roomId = dict[FirebaseKeys.rooms_roomId] as? String ?? FirebaseKeys.defaultString
        let isOpen = dict[FirebaseKeys.rooms_isOpen] as? Bool ?? FirebaseKeys.defaultBool
        let hasStarted = dict[FirebaseKeys.rooms_hasStarted] as? Bool ?? FirebaseKeys.defaultBool
        let players = dict[FirebaseKeys.rooms_players] as? [String: AnyObject] ?? [:]

        let room = RoomModel(roomId: roomId, isOpen: isOpen, hasStarted: hasStarted)
        for (playerUid, playerDescription) in players {
            room.addPlayer(firebasePlayerModelFactory(forUid: playerUid, forDescription: playerDescription))
        }
        return room
    }
    
    /**
     Adapter pattern:
     Creates a dictionary which translates to the firebase database reference for a player description inside a room
     - Parameters:
     - uid: uid of the player
     - name: name of the player
     - isHost: whether user is host
     - isReady: whether the player is ready
     - Returns: a dictionary representing the player object, ready to be inserted into firebase
     */
    func createPlayerDict(uid: String,
                          name: String,
                          isHost: Bool,
                          isReady: Bool,
                          avatar: String = FirebaseKeys.defaultAvatar) -> [String: AnyObject] {
        [
            FirebaseKeys.rooms_players_isHost: isHost as AnyObject,
            FirebaseKeys.rooms_players_uid: uid as AnyObject,
            FirebaseKeys.rooms_players_name: name as AnyObject,
            FirebaseKeys.rooms_players_isReady: isReady as AnyObject,
            FirebaseKeys.rooms_players_avatar: avatar as AnyObject
        ]
    }
    
    func encodePowerUp(powerUp: PowerUpModel?) -> [String: Any] {
        var encodedPowerUp: [String: Any] = [:]
        do {
            let powerUpData = try Util.encoder.encode(powerUp)
            encodedPowerUp = try JSONSerialization.jsonObject(with: powerUpData, options: .allowFragments)
                as? [String: Any] ?? [:]
        } catch { }
        return encodedPowerUp
    }
    
    func encodeEnemies(enemies: [EnemyModel]) -> [[String: Any]] {
        var encodedEnemies: [[String: Any]] = []
        do {
            for enemy in enemies {
                let enemyData = try Util.encoder.encode(enemy)
                let serializedMonster = try JSONSerialization.jsonObject(with: enemyData, options: .allowFragments)
                    as? [String: Any]
                guard let encodedEnemy = serializedMonster else {
                    continue
                }
                encodedEnemies.append(encodedEnemy)
            }
        } catch { }
        return encodedEnemies
    }
    
    func encodeMetadata(metadata: MetadataModel?) -> [String: Any] {
        var encodedMetadata: [String: Any] = [:]
        do {
            let metadataData = try Util.encoder.encode(metadata)
            encodedMetadata = try JSONSerialization.jsonObject(with: metadataData, options: .allowFragments)
                as? [String: Any] ?? [:]
        } catch { }
        return encodedMetadata
    }
    
    func decodePowerUp(data: [String: AnyObject]) -> PowerUpModel? {
        var decodedPowerUp: PowerUpModel?
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            decodedPowerUp = try Util.decoder.decode(PowerUpModel.self, from: jsonData)
        } catch { }
        return decodedPowerUp
    }
    
    func decodeEnemies(data: [[String: AnyObject]]) -> [EnemyModel] {
        var decodedEnemies: [EnemyModel]?
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            decodedEnemies = try Util.decoder.decode([EnemyModel].self, from: jsonData)
        } catch { }
        return decodedEnemies ?? []
    }
    
    func decodeMetadata(data: [String: AnyObject]) -> MetadataModel? {
        var decodedMetadata: MetadataModel?
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            decodedMetadata = try Util.decoder.decode(MetadataModel.self, from: jsonData)
        } catch { }
        return decodedMetadata
    }
}
