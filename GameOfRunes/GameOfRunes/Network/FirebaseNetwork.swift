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
    
    func createRoom(uid: String,
                    name: String,
                    _ onComplete: @escaping (String) -> Void,
                    _ onError: @escaping (Error) -> Void) {
        let roomId = generateRandomId()
        let ref = dbRef.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms, roomId]))
        
        ref.observeSingleEvent(of: .value, with: { [weak self] snapshot in
            if snapshot.value as? [String: AnyObject] != nil {
                // The room already exists, try generating another id.
                self?.createRoom(uid: uid, name: name, onComplete, onError)
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
                    onError(error)
                    return
                }
                
                ref.onDisconnectRemoveValue()
                onComplete(roomId)
            })
        }) { err in
            onError(err)
        }
    }
    
    func joinRoom(uid: String,
                  name: String,
                  forRoomId roomId: String,
                  _ onSuccess: @escaping () -> Void,
                  _ onRoomNotOpen: @escaping () -> Void,
                  _ onRoomNotExist: @escaping () -> Void,
                  _ onError: @escaping (Error) -> Void) {
        let ref = dbRef.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms, roomId]))
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard let roomDict = snapshot.value as? [String: AnyObject] else {
                onRoomNotExist()
                return
            }
            guard let isOpen = roomDict[FirebaseKeys.rooms_isOpen] as? Bool,
                let players = roomDict[FirebaseKeys.rooms_players] as? [String: AnyObject] else {
                    return
            }
            
            if !isOpen {
                onRoomNotOpen()
                return
            }
            
            if players[uid] != nil {
                // Player already inside the game
                return
            }
            let playerDict = self.createPlayerDict(uid: uid, name: name, isHost: false, isReady: false)
            let currentUserRef = ref.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms_players, uid]))
            currentUserRef.setValue(playerDict, withCompletionBlock: { err, _ in
                if let error = err {
                    onError(error)
                    return
                }
                currentUserRef.onDisconnectRemoveValue()
                onSuccess()
            })
        }) { err in
            onError(err)
        }
    }
    
    func closeRoom(uid: String,
                   forRoomId roomId: String,
                   _ onComplete: @escaping () -> Void,
                   _ onError: @escaping (Error) -> Void) {
        let ref = dbRef.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms, roomId]))
        let hostRef = ref.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms_players, uid,
                                                       FirebaseKeys.rooms_players_isHost]))
        hostRef.observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? Bool ?? false else {
                // User is not host, unable to close room
                return
            }
            ref.setValue(nil, withCompletionBlock: { err, _ in
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
    
    func leaveRoom(uid: String,
                   fromRoomId roomId: String,
                   _ onComplete: @escaping () -> Void,
                   _ onError: @escaping (Error) -> Void) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players, uid]))
        let isHostRef = ref.child(FirebaseKeys.rooms_players_isHost)
        
        isHostRef.observeSingleEvent(of: .value, with: { snapshot in
            guard let isHost = snapshot.value as? Bool else {
                // Player does not exist
                return
            }
            if isHost {
                self.closeRoom(uid: uid, forRoomId: roomId, {}, onError)
            } else {
                ref.setValue(nil, withCompletionBlock: { err, _ in
                    if let error = err {
                        onError(error)
                        return
                    }
                })
            }
            onComplete()
        }) { err in
            onError(err)
        }
    }
    
    func toggleReadyState(uid: String,
                          forRoomId roomId: String,
                          _ onComplete: @escaping () -> Void,
                          _ onError: @escaping (Error) -> Void) {
        let ref = dbRef.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players, uid,
                                                     FirebaseKeys.rooms_players_isReady]))
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard let isReady = snapshot.value as? Bool else {
                // Room does not exist
                return
            }
            ref.setValue(!isReady, withCompletionBlock: { err, _ in
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
    
    func changeRoomOpenState(forRoomId roomId: String,
                             _ onComplete: @escaping () -> Void,
                             _ onError: @escaping (Error) -> Void) {
        let ref = dbRef.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_isOpen]))
        
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
    
    func setAvatar(uid: String,
                      forRoomId id: String,
                      avatar: String,
                      _ onComplete: @escaping () -> Void,
                      _ onError: @escaping (Error) -> Void) {
        let ref = dbRef.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms, id, FirebaseKeys.rooms_players, uid,
                                                     FirebaseKeys.rooms_players_avatar]))
        ref.setValue(avatar, withCompletionBlock: { err, _ in
            if let error = err {
                onError(error)
                return
            }
            onComplete()
        })
    }
    
    func observeRoomState(forRoomId id: String,
                          _ onDataChange: @escaping (RoomModel) -> Void,
                          _ onRoomClose: @escaping () -> Void,
                          _ onError: @escaping (Error) -> Void) {
        let ref = dbRef.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms, id]))
        let handle = ref.observe(.value, with: { snapshot in
            guard let roomSnap = snapshot.value as? [String: AnyObject] else {
                // Room does not exist
                return
            }
            onDataChange(self.firebaseRoomModelFactory(forDict: roomSnap))
        }) { err in
            onError(err)
        }
        
        self.observers.append(FirebaseObserver(withHandle: handle, withRef: ref))
    }
    
    func removeObservers() {
        for observer in self.observers {
            observer.reference.removeObserver(withHandle: observer.handle)
        }
        observers = []
    }
    
    func updateGameHasStarted(roomId: String,
                              to: Bool,
                              _ onComplete: @escaping () -> Void,
                              _ onError: @escaping (Error) -> Void) {
        let ref = dbRef.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms,
                                                     roomId, FirebaseKeys.rooms_hasStarted]))
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard (snapshot.value as? Bool) != nil else {
                // Room does not exist
                return
            }
            ref.setValue(to, withCompletionBlock: { err, _ in
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
    
    func startGame(roomId: String,
                   _ onComplete: @escaping () -> Void,
                   _ notAllReady: @escaping () -> Void,
                   _ onError: @escaping (Error) -> Void) {
        let ref = dbRef.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players]))
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard let playersData = snapshot.value as? [String: AnyObject] else {
                // Players object does not exist in firebase.
                return
            }
            var players: [PlayerModel] = []
            for player in playersData {
                players.append(self.firebasePlayerModelFactory(forUid: player.key, forDescription: player.value))
            }
            // Check whether all players are ready - throw handler if not
            guard players.allSatisfy({ $0.isReady }) else {
                notAllReady()
                return
            }
            
            onComplete()
        }) { err in
            onError(err)
        }
    }
    
    func observeGameState(roomId: String,
                          _ onEvent: @escaping (PowerUpModel) -> Void,
                          _ onMonsterChange: @escaping ([MonsterModel]) -> Void,
                          _ onMonsterReceived: @escaping () -> Void,
                          _ onError: @escaping (Error) -> Void) {
        
    }
    
    func pushMonsters(roomId: String,
                      uid: String,
                      monsters: [MonsterModel],
                      _ onComplete: @escaping () -> Void,
                      _ onError: @escaping (Error) -> Void) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players,
                                                     uid, FirebaseKeys.rooms_players_monsters]))
        let encodedMonsters = encodeMonsters(monsters: monsters)
        ref.setValue(encodedMonsters, withCompletionBlock: { err, _ in
            if let error = err {
                onError(error)
                return
            }
            onComplete()
        })
    }
    
    func pushPowerUp(roomId: String,
                     uid: String,
                     powerUp: PowerUpModel,
                     _ onComplete: @escaping () -> Void,
                     _ onError: @escaping (Error) -> Void) {
        
        let ref = dbRef.child(FirebaseKeys.joinKeys([FirebaseKeys.rooms, roomId, FirebaseKeys.rooms_players,
                                                     uid, FirebaseKeys.rooms_players_powerUp]))
        let encodedPowerUp = encodePowerUp(powerUp: powerUp)
        ref.setValue(encodedPowerUp, withCompletionBlock: { err, _ in
            if let error = err {
                onError(error)
                return
            }
            onComplete()
        })
    }
}
