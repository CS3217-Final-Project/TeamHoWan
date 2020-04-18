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
    
    func createRoom(
        uid: String,
        name: String,
        completion: ((String, String) -> Void)? = nil,
        onError: ((Error) -> Void)? = nil
    ) {
        let roomId = randomId
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
            roomDict.updateValue(false as AnyObject, forKey: FirebaseKeys.rooms_gameCreated)
            
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
    
    func joinRoom(
        uid: String,
        name: String,
        roomId: String,
        completion: ((String) -> Void)? = nil,
        onRoomNotOpen: (() -> Void)? = nil,
        onRoomNotExist: (() -> Void)? = nil,
        onError: ((Error) -> Void)? = nil
    ) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId))
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard let roomDict = snapshot.value as? [String: AnyObject] else {
                onRoomNotExist?()
                return
            }
            guard let isOpen = roomDict[FirebaseKeys.rooms_isOpen] as? Bool,
                let players = roomDict[FirebaseKeys.rooms_players] as? [String: AnyObject] else {
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
            let playerDict = self.createPlayerDict(uid: uid, name: name, isHost: false, isReady: false)
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
    
    func closeRoom(uid: String, roomId: String, completion: (() -> Void)? = nil, onError: ((Error) -> Void)? = nil) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId))
        let hostRef = ref.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms_players, uid, FirebaseKeys.rooms_players_isHost))
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
    
    func leaveRoom(uid: String, roomId: String, completion: (() -> Void)? = nil, onError: ((Error) -> Void)? = nil) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players, uid))
        let isHostRef = ref.child(FirebaseKeys.rooms_players_isHost)
        
        isHostRef.observeSingleEvent(of: .value, with: { snapshot in
            guard let isHost = snapshot.value as? Bool else {
                // Player does not exist
                return
            }
            if isHost {
                self.closeRoom(uid: uid, roomId: roomId, onError: onError)
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
    
    func toggleReadyState(
        uid: String,
        roomId: String,
        completion: (() -> Void)? = nil,
        onError: ((Error) -> Void)? = nil
    ) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players, uid,
                                                    FirebaseKeys.rooms_players_isReady))
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard let isReady = snapshot.value as? Bool else {
                // Room does not exist
                return
            }
            ref.setValue(!isReady, withCompletionBlock: { err, _ in
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
    
    func setAvatar(
        uid: String,
        roomId: String,
        avatar: String,
        completion: (() -> Void)? = nil,
        onError: ((Error) -> Void)? = nil
    ) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players, uid,
                                                    FirebaseKeys.rooms_players_avatar))
        ref.setValue(avatar, withCompletionBlock: { err, _ in
            if let error = err {
                onError?(error)
                return
            }
        })
    }
    
    func observeRoomState(
        roomId: String,
        onDataChange: ((RoomModel) -> Void)? = nil,
        onRoomClose: (() -> Void)? = nil,
        onError: ((Error) -> Void)? = nil
    ) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId))
        let handle = ref.observe(.value, with: { snapshot in
            guard let roomSnap = snapshot.value as? [String: AnyObject] else {
                // Room does not exist
                onRoomClose?()
                return
            }
            let roomModel = self.firebaseRoomModelFactory(forDict: roomSnap)
            guard !roomModel.players.isEmpty else {
                onRoomClose?()
                return
            }
            onDataChange?(roomModel)
        }) { err in
            onError?(err)
        }
        
        self.observers.append(FirebaseObserver(withHandle: handle, withRef: ref))
    }
    
    func removeObservers() {
        observers.forEach { observer in observer.reference.removeObserver(withHandle: observer.handle) }
        observers = []
    }

    func startGame(
        roomId: String,
        completion: (() -> Void)? = nil,
        onNotAllReady: (() -> Void)? = nil,
        onError: ((Error) -> Void)? = nil
    ) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players))
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard let playersData = snapshot.value as? [String: AnyObject],
                playersData.count > 1 else {
                // TODO: Custom errors
                // Players object does not exist in firebase / only 1 or less players in the room.
                return
            }
            var players: [PlayerModel] = []
            for player in playersData {
                players.append(self.firebasePlayerModelFactory(forUid: player.key, forDescription: player.value))
            }
            // Check whether all non-host players are ready - throw handler if not
            for player in players where !player.isReady && !player.isHost {
                onNotAllReady?()
                return
            }

            completion?()
        }) { err in
            onError?(err)
        }
    }
    
    func observeGameState(
        roomId: String,
        onEvent: ((PowerUpModel) -> Void)? = nil,
        onMonsterChange: (([MonsterModel]) -> Void)? = nil,
        onMonsterReceived: (() -> Void)? = nil,
        onError: ((Error) -> Void)? = nil
    ) {
        // To be implemented
    }
    
    func updateGameHasStarted(
        roomId: String,
        to: Bool,
        completion: (() -> Void)? = nil,
        onError: ((Error) -> Void)? = nil
    ) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_hasStarted))
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard (snapshot.value as? Bool) != nil else {
                // TODO: Custom error - room does not exist
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

    func getAvatar(
        roomId: String,
        uid: String,
        completion: ((Avatar) -> Void)? = nil,
        onError: ((Error) -> Void)? = nil
    ) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players,
                                                    uid, FirebaseKeys.rooms_players_avatar))
        ref.observeSingleEvent(of: .value, with: { snap in
            guard let avatarString = snap.value as? String,
                let avatar = Avatar.getAvatar(withName: avatarString) else {
                return
            }
            completion?(avatar)
        }) { err in
            onError?(err)
        }
    }
    
    func getPlayersUid(roomId: String, completion: (([String]) -> Void)? = nil, onError: ((Error) -> Void)? = nil) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId))
        ref.observeSingleEvent(of: .value, with: { snap in
            guard let room = snap.value as? [String: AnyObject] else {
                return
            }
            let roomModel = self.firebaseRoomModelFactory(forDict: room)
            completion?(roomModel.players.map({ $0.uid }))
        }) { err in
            onError?(err)
        }
    }
    
    func pushMonsters(
        roomId: String,
        uid: String,
        monsters: [MonsterModel],
        completion: (() -> Void)? = nil,
        onError: ((Error) -> Void)? = nil
    ) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players,
                                                    uid, FirebaseKeys.rooms_players_monsters))
        let encodedMonsters = encodeMonsters(monsters: monsters)
        ref.setValue(encodedMonsters, withCompletionBlock: { err, _ in
            if let error = err {
                onError?(error)
                return
            }
            completion?()
        })
    }
    
    func pushPowerUp(
        roomId: String,
        uid: String,
        powerUp: PowerUpModel,
        completion: (() -> Void)? = nil,
        onError: ((Error) -> Void)? = nil
    ) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players,
                                                    uid, FirebaseKeys.rooms_players_powerUp))
        let encodedPowerUp = encodePowerUp(powerUp: powerUp)
        ref.setValue(encodedPowerUp, withCompletionBlock: { err, _ in
            if let error = err {
                onError?(error)
                return
            }
            completion?()
        })
    }

    func changeRoomOpenState(forRoomId roomId: String,
                             _ onComplete: @escaping () -> Void,
                             _ onError: @escaping (Error) -> Void) {
        let ref = dbRef.child(FirebaseKeys.joinKeys(FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_isOpen))
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard let isOpen = snapshot.value as? Bool else {
                // Room does not exist
                return
            }
            ref.setValue(!isOpen, withCompletionBlock: { err, _ in
                if let error = err {
                    onError(error)
                    return
                }
                onComplete()
            })
        }) { err in
            onError(err)
        }
    }
}
