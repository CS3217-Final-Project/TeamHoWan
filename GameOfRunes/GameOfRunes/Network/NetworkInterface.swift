//
//  NetworkInterface.swift
//  GameOfRunes
//
//  Created by Andy on 1/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation
import Reachability

/**
 Interface for the network. Contains methods to obtain/receive information from the game network.
 */
protocol NetworkInterface {
    /**
     Connection observer
     - Parameters:.
     - uponDisconnect - handler upon disconnection
     */
    func addConnectionObserver(uponDisconnect: (() -> Void)?)
    
    // ================================== Room functions =========================================
    
    /**
     Create a room instance in the database. This method generates a short 5-digit unique room ID
     and calls the completion handle.
     - Parameters:
     - uid: uid of the Player
     - name: name of the Player
     - completion: completion handler
     - onError: error handler
     */
    func createRoom(uid: String, name: String, completion: ((String, String) -> Void)?, onError: ((Error) -> Void)?)
    
    /**
     Joins a room and creates a reference to the players list inside the room object
     - Parameters:
     - uid: uid of the Player
     - name: name of the Player
     - roomId: the room id this listener is listening to
     - completion: completion handler
     - onRoomNotOpen: callback that is fired if the room is not open
     - onRoomNotExist: callback that is fired if the room does not exist
     - onError: error handler
     */
    func joinRoom(
        uid: String,
        name: String,
        roomId: String,
        completion: ((String) -> Void)?,
        onRoomNotOpen: (() -> Void)?,
        onRoomNotExist: (() -> Void)?,
        onError: ((Error) -> Void)?
    )
    
    /**
     Close the room if the player is the host.
     - Parameters:
     - uid: uid of the Player
     - roomId: room id of the room that the player is in
     - completion: completion handler
     - onError: error handler
     */
    func closeRoom(uid: String, roomId: String, completion: (() -> Void)?, onError: ((Error) -> Void)?)
    
    /**
     Leave the room that the player is in
     - Parameters:
     - uid: uid of the Player
     - roomId: room id of the room that the player is in
     - completion: completion handler
     - onError: error handler
     */
    func leaveRoom(uid: String, roomId: String, completion: (() -> Void)?, onError: ((Error) -> Void)?)
    
    /**
     Toggle the player's isReady state in the room that the player is in.
     - Parameters:
     - uid: uid of the Player
     - roomId: room id of the room that the player is in
     - completion: completion handler
     - onError: error handler
     */
    func updateReadyState(uid: String, roomId: String, newValue: Bool, completion: (() -> Void)?, onError: ((Error) -> Void)?)
    
    /**
     Toggle the player's avatar in the room that the player is in.
     - Parameters:
     - uid: uid of the Player
     - roomId: room id of the room that the player is in
     - avatar: string representing the avatar to be changed to
     - completion: completion handler
     - onError: error handler
     */
    func setAvatar(uid: String, roomId: String, avatar: String, completion: (() -> Void)?, onError: ((Error) -> Void)?)
    
    /**
     Creates a listener for a room instance.
     This listener is fired every time any child is changed in the Room object in the database.
     This method should be used by the client to know when the game starts,
     and also be used by the front end to reflect room changes.
     Creates an observer.
     - Parameters:
     - roomId: the room id this listener is listening to
     - onDataChange: callback that is fired every time change is detected
     - onRoomClose: callback that is fired if the room closes
     - onError: error handler
     */
    func observeRoomState(roomId: String,
                          onDataChange: ((RoomModel) -> Void)?,
                          onRoomClose: (() -> Void)?,
                          onError: ((Error) -> Void)?)
    
    func observeEnemy(roomId: String,
                      uid: String,
                      onDataChange: (([EnemyModel]) -> Void)?,
                      onError: ((Error) -> Void)?)
    
    func observeMetadata(roomId: String,
                         uid: String,
                         onDataChange: ((MetadataModel) -> Void)?,
                         onError: ((Error) -> Void)?)
    
    func observePowerUp(roomId: String,
                        uid: String,
                        onDataChange: ((PowerUpModel) -> Void)?,
                        onError: ((Error) -> Void)?)
    
    /**
     Removes all observers.
     */
    func removeObservers()
    
    /**
     Starts a game instance for a particular room. This method creates the game by calling`createGame`
     and changes the `hasStarted` flag of the room.
     - Parameters:
     - roomId: the room id
     - completion: completion handler
     - onNotAllReady: callback fired when not everyone in the room is ready.
     - onError: error handler
     */
    func startGame(roomId: String, completion: (() -> Void)?, insufficientPlayers: (() -> Void)?,
                   onNotAllReady: (() -> Void)?, onError: ((Error) -> Void)?)
    
    /**
     Updates game boolean flag "has_started" to the specified boolean value
     - Parameters:
     - roomId: the game id concerned
     - to: the boolean value for "has ended" flag
     - completion: completion handler
     - onError: error handler
     */
    func updateGameHasStarted(roomId: String, to: Bool, completion: (() -> Void)?, onError: ((Error) -> Void)?)

    /**
     Get an avatar in given room and given uid.
     - Parameters:
     - roomId: the game id concerned
     - uid: player uid concerned
     - completion: completion handler
     - onError: error handler
     */
    func getAvatar(roomId: String, uid: String, completion: ((Avatar) -> Void)?, onError: ((Error) -> Void)?)
    
    /**
     Update own monsters on the network.
     - Parameters:
     - roomId: the game id concerned
     - uid: UID of the player
     - monsters: the monsters to be sent
     - completion: completion handler
     - onError: error handler
     */
    func updateMonsters(roomId: String,
                        uid: String,
                        monsters: [EnemyModel],
                        completion: (() -> Void)?,
                        onError: ((Error) -> Void)?)
    
    /**
     Update with a powerUp activation event.
     - Parameters:
     - roomId: the game id concerned
     - uid: UID of the player
     - powerUp: the powerUp concerned
     - completion: completion handler
     - onError: error handler
     */

    func updatePowerUp(roomId: String,
                       uid: String,
                       powerUp: PowerUpModel,
                       completion: (() -> Void)?,
                       onError: ((Error) -> Void)?)
    
    func updateMetadata(roomId: String,
                        uid: String,
                        metadata: MetadataModel,
                        completion: (() -> Void)?,
                        onError: ((Error) -> Void)?)
    
    func updateDidLose(roomId: String,
                       uid: String,
                       didLose: Bool,
                       completion: (() -> Void)?,
                       onError: ((Error) -> Void)?)
    
    func resetPlayerState(roomId: String,
                          uid: String,
                          completion: (() -> Void)?,
                          onError: ((Error) -> Void)?)
}

extension NetworkInterface {
    func checkForConnection() {
        
    }
}
