//
//  FirebaseNetwork+Util.swift
//  GameOfRunes
//
//  Created by Andy on 1/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation

extension FirebaseNetwork {
    private var encoder: JSONEncoder {
        JSONEncoder()
    }

    private var decoder: JSONDecoder {
        JSONDecoder()
    }
    
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
        let isHost = description[FirebaseKeys.rooms_players_isHost] as? Bool ?? FirebaseKeys.defaultFalse
        let uid = description[FirebaseKeys.rooms_players_uid] as? String ?? FirebaseKeys.defaultEmptyString
        let name = description[FirebaseKeys.rooms_players_name] as? String ?? FirebaseKeys.defaultEmptyString
        let avatar = description[FirebaseKeys.rooms_players_avatar] as? String ?? FirebaseKeys.defaultAvatar
        let isReady = description[FirebaseKeys.rooms_players_isReady] as? Bool ?? FirebaseKeys.defaultFalse
        return PlayerModel(uid: uid, isHost: isHost, name: name, isReady: isReady, avatar: avatar)
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
        let roomId = dict[FirebaseKeys.rooms_roomId] as? String ?? FirebaseKeys.defaultEmptyString
        let isOpen = dict[FirebaseKeys.rooms_isOpen] as? Bool ?? FirebaseKeys.defaultFalse
        let hasStarted = dict[FirebaseKeys.rooms_hasStarted] as? Bool ?? FirebaseKeys.defaultFalse
        let gameCreated = dict[FirebaseKeys.rooms_gameCreated] as? Bool ?? FirebaseKeys.defaultFalse
        let players = dict[FirebaseKeys.rooms_players] as? [String: AnyObject] ?? [:]

        let room = RoomModel(roomId: roomId, isOpen: isOpen, hasStarted: hasStarted, gameCreated: gameCreated)
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
            let powerUpData = try encoder.encode(powerUp)
            encodedPowerUp = try JSONSerialization.jsonObject(with: powerUpData, options: .allowFragments)
                as? [String: Any] ?? [:]
        } catch { }
        return encodedPowerUp
    }
    
    func encodeMonsters(monsters: [EnemyModel]) -> [[String: Any]] {
        var encodedMonsters: [[String: Any]] = []
        do {
            for monster in monsters {
                let monsterData = try encoder.encode(monster)
                let serializedMonster = try JSONSerialization.jsonObject(with: monsterData, options: .allowFragments)
                    as? [String: Any]
                guard let encodedMonster = serializedMonster else {
                    continue
                }
                encodedMonsters.append(encodedMonster)
            }
        } catch { }
        return encodedMonsters
    }
    
    func encodeMetadata(metadata: MetadataModel?) -> [String: Any] {
        var encodedMetadata: [String: Any] = [:]
        do {
            let metadataData = try encoder.encode(metadata)
            encodedMetadata = try JSONSerialization.jsonObject(with: metadataData, options: .allowFragments)
                as? [String: Any] ?? [:]
        } catch { }
        return encodedMetadata
    }
    
    func decodePowerUp(data: [String: AnyObject]) -> PowerUpModel? {
        var decodedPowerUp: PowerUpModel?
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            decodedPowerUp = try decoder.decode(PowerUpModel.self, from: jsonData)
        } catch {
            print(error)
        }
        return decodedPowerUp
    }
    
    func decodeMonsters(data: [[String: AnyObject]]) -> [EnemyModel] {
        var decodedMonsters: [EnemyModel]?
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            decodedMonsters = try decoder.decode([EnemyModel].self, from: jsonData)
        } catch {
            print(error)
        }
        return decodedMonsters ?? []
    }
    
    func decodeMetadata(data: [String: AnyObject]) -> MetadataModel? {
        var decodedMetadata: MetadataModel?
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            decodedMetadata = try decoder.decode(MetadataModel.self, from: jsonData)
        } catch {
            print(error)
        }
        return decodedMetadata
    }
}
