//
//  FirebaseNetwork.swift
//  GameOfRunes
//
//  Created by Andy on 1/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Firebase

class FirebaseNetwork: NetworkInterface {
    let dbRef: DatabaseReference = Database.database().reference()
    var observers: [FirebaseObserver] = []
    
    deinit {
        removeObservers()
    }
    
    func addConnectionObserver(uponDisconnect: (() -> Void)?) {
        let ref = Database.database().reference(withPath: ".info/connected")
        let handle = ref.observe(.value, with: { snapshot in
            if snapshot.value as? Bool ?? false {
                print("Connected")
            } else {
                if let uponDisconnect = uponDisconnect {
                    uponDisconnect()
                }
            }
        })

        self.observers.append(FirebaseObserver(withHandle: handle, withRef: ref))
    }
    
    func createRoom(uid: String,
                    name: String,
                    completion: ((String, String) -> Void)? = nil,
                    onError: ((Error) -> Void)? = nil) {
        let roomId = Util.generateUuid()
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId))
        ref.observeSingleEvent(of: .value, with: { [weak self] snapshot in
            if snapshot.value as? [String: AnyObject] != nil {
                // The room already exists, try generating another id.
                self?.createRoom(uid: uid, name: name, completion: completion, onError: onError)
                return
            }
            
            let playerDict = self?.createPlayerDict(uid: uid, name: name, isHost: true, isReady: false)
            var roomDict: [String: AnyObject] = [:]
            roomDict.updateValue(roomId as AnyObject, forKey: FirebaseKeys.rooms_roomId)
            roomDict.updateValue([uid: playerDict] as AnyObject, forKey: FirebaseKeys.rooms_players)
            roomDict.updateValue(true as AnyObject, forKey: FirebaseKeys.rooms_isOpen)
            roomDict.updateValue(false as AnyObject, forKey: FirebaseKeys.rooms_hasStarted)

            ref.setValue(roomDict, withCompletionBlock: { err, ref in
                if let error = err {
                    onError?(error)
                    return
                }
                
                ref.onDisconnectRemoveValue()
                completion?(uid, roomId)
            })
        }) { err in
            onError?(err)
        }
    }
    
    func joinRoom(roomId: String,
                  uid: String,
                  name: String,
                  completion: ((String) -> Void)? = nil,
                  onRoomNotOpen: (() -> Void)? = nil,
                  onRoomNotExist: (() -> Void)? = nil,
                  onError: ((Error) -> Void)? = nil) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId))
        
        ref.observeSingleEvent(of: .value, with: { [weak self] snapshot in
            guard let roomDict = snapshot.value as? [String: AnyObject] else {
                onRoomNotExist?()
                return
            }
            guard let isOpen = roomDict[FirebaseKeys.rooms_isOpen] as? Bool,
                let players = roomDict[FirebaseKeys.rooms_players] as? [String: AnyObject] else {
                    if let onError = onError {
                        onError(NetworkError.incorrectDatabaseSchema)
                    }
                    return
            }
            
            if !isOpen {
                onRoomNotOpen?()
                return
            }
            
            if players[uid] != nil {
                // Player already inside the game
                return
            }

            let playerDict = self?.createPlayerDict(uid: uid, name: name, isHost: false, isReady: false)
            let currentUserRef = ref.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms_players, uid))
            currentUserRef.setValue(playerDict, withCompletionBlock: { err, _ in
                if let error = err {
                    onError?(error)
                    return
                }
                currentUserRef.onDisconnectRemoveValue()
                completion?(uid)
            })
        }) { err in
            onError?(err)
        }
    }
    
    func leaveRoom(roomId: String,
                   uid: String,
                   completion: (() -> Void)? = nil,
                   onError: ((Error) -> Void)? = nil) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players, uid))
        let isHostRef = ref.child(FirebaseKeys.rooms_players_isHost)
        
        isHostRef.observeSingleEvent(of: .value, with: { [weak self] snapshot in
            guard let isHost = snapshot.value as? Bool else {
                // Player does not exist
                if let onError = onError {
                    onError(NetworkError.incorrectDatabaseSchema)
                }
                return
            }
            if isHost {
                self?.closeRoom(roomId: roomId, uid: uid, completion: nil, onError: onError)
            } else {
                ref.setValue(nil, withCompletionBlock: { err, _ in
                    if let error = err {
                        onError?(error)
                        return
                    }
                })
            }
            completion?()
        }) { err in
            onError?(err)
        }
    }
    
    private func closeRoom(roomId: String,
                           uid: String,
                           completion: (() -> Void)? = nil,
                           onError: ((Error) -> Void)? = nil) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId))
        let hostRef = ref.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms_players, uid,
                                                      FirebaseKeys.rooms_players_isHost))
        hostRef.observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? Bool ?? false else {
                // User is not host, unable to close room
                return
            }
            ref.setValue(nil, withCompletionBlock: { err, _ in
                if let error = err {
                    onError?(error)
                    return
                }
                
                completion?()
            })
        }) { err in
            onError?(err)
        }
    }
    
    func observeRoom(roomId: String,
                     onDataChange: ((RoomModel) -> Void)? = nil,
                     onRoomClose: (() -> Void)? = nil,
                     onError: ((Error) -> Void)? = nil) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId))
        let handle = ref.observe(.value, with: { [weak self] snapshot in
            guard let roomSnap = snapshot.value as? [String: AnyObject],
                let roomModel = self?.firebaseRoomModelFactory(forDict: roomSnap) else {
                    // Room does not exist
                    onRoomClose?()
                    return
            }
            
            guard !roomModel.players.isEmpty else {
                onRoomClose?()
                return
            }
            let playerCount = roomModel.players.count
            if playerCount > 1 {
                self?.setRoomOpenState(roomId: roomId, to: false)
            } else if playerCount == 1 {
                self?.setRoomOpenState(roomId: roomId, to: true)
            }
            onDataChange?(roomModel)
        }) { err in
            onError?(err)
        }
        
        self.observers.append(FirebaseObserver(withHandle: handle, withRef: ref))
    }
    
    private func setRoomOpenState(roomId: String,
                                  to: Bool,
                                  completion: (() -> Void)? = nil,
                                  onError: ((Error) -> Void)? = nil) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_isOpen))
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? Bool != nil else {
                if let onError = onError {
                    onError(NetworkError.incorrectDatabaseSchema)
                }
                return
            }
            ref.setValue(to, withCompletionBlock: { err, _ in
                if let error = err {
                    onError?(error)
                    return
                }
                completion?()
            })
        }) { err in
            onError?(err)
        }
    }
    
    func startGame(roomId: String,
                   completion: (() -> Void)? = nil,
                   insufficientPlayers: (() -> Void)? = nil,
                   onNotAllReady: (() -> Void)? = nil,
                   onError: ((Error) -> Void)? = nil) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players))
        
        ref.observeSingleEvent(of: .value, with: { [weak self] snapshot in
            guard let playersData = snapshot.value as? [String: AnyObject] else {
                // Players object does not exist
                onError?(NetworkError.incorrectDatabaseSchema)
                return
            }
            guard playersData.count > 1 else {
                insufficientPlayers?()
                return
            }
            
            var players: [PlayerModel] = []
            for player in playersData {
                guard let playerModel = self?
                    .firebasePlayerModelFactory(forUid: player.key, forDescription: player.value) else {
                        return
                }
                players.append(playerModel)
            }
            // Check whether all non-host players are ready - throw handler if not
            for player in players where !player.isReady && !player.isHost {
                onNotAllReady?()
                return
            }
            
            self?.updateRoomHasStarted(roomId: roomId, to: true, completion: completion, onError: onError)
        }) { err in
            onError?(err)
        }
    }
    
    func updateRoomHasStarted(roomId: String,
                              to: Bool,
                              completion: (() -> Void)? = nil,
                              onError: ((Error) -> Void)? = nil) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_hasStarted))
        ref.setValue(to, withCompletionBlock: { err, _ in
            if let error = err {
                onError?(error)
                return
            }
        })
    }
    
    func updatePlayerIsReady(roomId: String,
                             uid: String,
                             to: Bool,
                             completion: (() -> Void)? = nil,
                             onError: ((Error) -> Void)? = nil) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players,
                                                    uid, FirebaseKeys.rooms_players_isReady))
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value is Bool else {
                // Room does not exist
                onError?(NetworkError.incorrectDatabaseSchema)
                return
            }
            ref.setValue(to, withCompletionBlock: { err, _ in
                if let error = err {
                    onError?(error)
                    return
                }
                completion?()
            })
        }) { err in
            onError?(err)
        }
    }
    
    func updateAvatar(roomId: String,
                      uid: String,
                      avatar: String,
                      completion: (() -> Void)? = nil,
                      onError: ((Error) -> Void)? = nil) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players, uid,
                                                    FirebaseKeys.rooms_players_avatar))
        ref.setValue(avatar, withCompletionBlock: { err, _ in
            if let error = err {
                onError?(error)
                return
            }
        })
    }
    
    // ================================== Game functions =========================================
    
    func updateDidLose(roomId: String,
                       uid: String,
                       didLose: Bool,
                       completion: (() -> Void)? = nil,
                       onError: ((Error) -> Void)? = nil) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players,
                                                    uid, FirebaseKeys.rooms_players_didLose))
        ref.setValue(didLose, withCompletionBlock: { err, _ in
            if let error = err {
                onError?(error)
                return
            }
            self.dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.games, roomId)).setValue(nil)
            completion?()
        })
    }
    
    func observeEnemies(roomId: String,
                        uid: String,
                        onDataChange: (([EnemyModel]) -> Void)?,
                        onError: ((Error) -> Void)?) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.games, roomId, FirebaseKeys.games_players,
                                                    uid, FirebaseKeys.games_players_monsters))
        let handle = ref.observe(.value, with: { [weak self] snapshot in
            guard let data = snapshot.value as? [[String: AnyObject]],
                let monsters = self?.decodeEnemies(data: data) else {
                    return
            }
            onDataChange?(monsters)
        }) { err in
            onError?(err)
        }
        
        self.observers.append(FirebaseObserver(withHandle: handle, withRef: ref))
    }
    
    func observeMetadata(roomId: String,
                         uid: String,
                         onDataChange: ((MetadataModel) -> Void)?,
                         onError: ((Error) -> Void)?) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.games, roomId, FirebaseKeys.games_players,
                                                    uid, FirebaseKeys.games_players_metadata))
        let handle = ref.observe(.value, with: { [weak self] snapshot in
            guard let data = snapshot.value as? [String: AnyObject],
                let metadata = self?.decodeMetadata(data: data) else {
                    return
            }
            onDataChange?(metadata)
        }) { err in
            onError?(err)
        }
        
        self.observers.append(FirebaseObserver(withHandle: handle, withRef: ref))
    }
    
    func observePowerUp(roomId: String,
                        uid: String,
                        onDataChange: ((PowerUpModel) -> Void)?,
                        onError: ((Error) -> Void)?) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.games, roomId, FirebaseKeys.games_players,
                                                    uid, FirebaseKeys.games_players_powerUp))
        let handle = ref.observe(.value, with: { [weak self] snapshot in
            guard let data = snapshot.value as? [String: AnyObject],
                let powerUp = self?.decodePowerUp(data: data) else {
                    return
            }
            onDataChange?(powerUp)
        }) { err in
            onError?(err)
        }
        
        self.observers.append(FirebaseObserver(withHandle: handle, withRef: ref))
    }
    
    func observeEnemiesKilled(roomId: String,
                              uid: String,
                              onDataChange: ((Int) -> Void)? = nil,
                              onError: ((Error) -> Void)? = nil) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.games, roomId, FirebaseKeys.games_players,
                                                    uid, FirebaseKeys.games_players_enemies_killed))
        
        let handle = ref.observe(.value, with: { snapshot in
            guard let data = snapshot.value as? Int else {
                return
            }
            onDataChange?(data)
        }) { err in
            onError?(err)
        }
        
        self.observers.append(FirebaseObserver(withHandle: handle, withRef: ref))
    }
    
    func updateEnemies(roomId: String,
                       uid: String,
                       enemies: [EnemyModel],
                       completion: (() -> Void)? = nil,
                       onError: ((Error) -> Void)? = nil) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.games, roomId, FirebaseKeys.games_players,
                                                    uid, FirebaseKeys.games_players_monsters))
        let encodedEnemies = encodeEnemies(enemies: enemies)
        ref.onDisconnectRemoveValue()
        ref.setValue(encodedEnemies, withCompletionBlock: { err, _ in
            if let error = err {
                onError?(error)
                return
            }
            completion?()
        })
    }
    
    func updateMetadata(roomId: String,
                        uid: String,
                        metadata: MetadataModel,
                        completion: (() -> Void)? = nil,
                        onError: ((Error) -> Void)? = nil) {

        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.games, roomId, FirebaseKeys.games_players,
                                                    uid, FirebaseKeys.games_players_metadata))
        let encodedMetadata = encodeMetadata(metadata: metadata)
        ref.onDisconnectRemoveValue()
        ref.setValue(encodedMetadata, withCompletionBlock: { err, _ in
            if let error = err {
                onError?(error)
                return
            }
            completion?()
        })
    }
    
    func updatePowerUp(roomId: String,
                       uid: String,
                       powerUp: PowerUpModel,
                       completion: (() -> Void)? = nil,
                       onError: ((Error) -> Void)? = nil) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.games, roomId, FirebaseKeys.games_players,
                                                    uid, FirebaseKeys.games_players_powerUp))
        let encodedPowerUp = encodePowerUp(powerUp: powerUp)
        ref.onDisconnectRemoveValue()
        ref.setValue(encodedPowerUp, withCompletionBlock: { err, _ in
            if let error = err {
                onError?(error)
                return
            }
            completion?()
        })
    }
    
    func updateEnemiesKilled(roomId: String,
                             uid: String,
                             count: Int,
                             completion: (() -> Void)? = nil,
                             onError: ((Error) -> Void)? = nil) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.games, roomId, FirebaseKeys.games_players,
                                                    uid, FirebaseKeys.games_players_enemies_killed))
        ref.setValue(count, withCompletionBlock: { err, _ in
            if let error = err {
                onError?(error)
                return
            }
            completion?()
        })
    }

    func resetGameState(roomId: String,
                        uid: String,
                        completion: (() -> Void)? = nil,
                        onError: ((Error) -> Void)? = nil) {
        
        updateDidLose(roomId: roomId, uid: uid, didLose: false, onError: onError)
        updatePlayerIsReady(roomId: roomId, uid: uid, to: false, onError: onError)
        let gameRef = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.games, roomId))
        gameRef.removeValue(completionBlock: { err, _ in
            if let error = err {
                onError?(error)
                return
            }
            completion?()
        })
    }
    
    func removeObservers() {
        observers.forEach { observer in observer.reference.removeObserver(withHandle: observer.handle) }
        observers = []
    }
}
