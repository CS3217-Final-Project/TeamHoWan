//
//  NetworkInterface.swift
//  GameOfRunes
//
//  Created by Andy on 1/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation

/**
 Interface for the network. Contains methods to obtain/receive information from the game network.
 */
protocol NetworkInterface {
    
    // ================================== Room functions =========================================
    
    /**
     Create a room instance in the database. This method generates a short 5-digit unique room ID and calls the completion handle.
     - Parameters:
     - uid: uid of the Player
     - name: name of the Player
     - onComplete: completion handler
     - onError: error handler
     */
    func createRoom(uid: String,
                    name: String,
                    _ onComplete: @escaping (String) -> Void,
                    _ onError: @escaping (Error) -> Void) 
    
    /**
     Joins a room and creates a reference to the players list inside the room object
     - Parameters:
     - uid: uid of the Player
     - name: name of the Player
     - forRoomId: the room id this listener is listening to
     - onRoomNotOpen: callback that is fired if the room is not open
     - onRoomNotExist: callback that is fired if the room does not exist
     - onError: callback that is fired if there is an error
     */
    func joinRoom(uid: String,
                  name: String,
                  forRoomId roomId: String,
                  _ onSuccess: @escaping () -> Void,
                  _ onRoomNotOpen: @escaping () -> Void,
                  _ onRoomNotExist: @escaping () -> Void,
                  _ onError: @escaping (Error) -> Void)
    
    /**
     Close the room if the player is the host.
     - Parameters:
     - uid: uid of the Player
     - forRoomId: room id of the room that the player is in
     - onComplete: completion handler
     - onError: error handler
     */
    func closeRoom(uid: String,
                   forRoomId roomId: String,
                   _ onComplete: @escaping () -> Void,
                   _ onError: @escaping (Error) -> Void)
    
    /**
     Leave the room that the player is in
     - Parameters:
     - uid: uid of the Player
     - forRoomId: room id of the room that the player is in
     - onComplete: completion handler
     - onError: error handler
     */
    func leaveRoom(uid: String,
                   fromRoomId id: String,
                   _ onComplete: @escaping () -> Void,
                   _ onError: @escaping (Error) -> Void)
    
    /**
     Toggle the player's isReady state in the room that the player is in.
     - Parameters:
     - uid: uid of the Player
     - forRoomId: room id of the room that the player is in
     - onComplete: completion handler
     - onError: error handler
     */
    func changeReadyState(uid: String,
                          forRoomId id: String,
                          _ onComplete: @escaping () -> Void,
                          _ onError: @escaping (Error) -> Void)
    
    /**
     Creates a listener for a room instance. This listener is fired every time any child is changed in the Room object in the database.
     This method should be used by the client to know when the game starts, and also be used by the front end to reflect room changes.
     Creates an observer.
     - Parameters:
     - forRoomId: the room id this listener is listening to
     - onDataChange: callback that is fired every time change is detected
     - onRoomClose: callback that is fired if the room closes
     - onError: callback that is fired if there is an error
     */
    func observeRoomState(forRoomId id: String,
                          _ onDataChange: @escaping (RoomModel) -> Void,
                          _ onRoomClose: @escaping () -> Void,
                          _ onError: @escaping (Error) -> Void)
    
    /**
     Removes all observers.
     */
    func removeObservers()
    
    /**
     Starts a game instance for a particular room. This method changes the state of the room and
     creates the game by calling`createGame`.
     - Parameters:
     - roomId: the room id
     - onComplete: completion handler
     - onError: callback that is fired if there is an error
     */
    func startGame(roomId: String,
                   _ onComplete: @escaping () -> Void,
                   _ onError: @escaping (Error) -> Void)
    
    /**
     Creates a game database reference to the specified room.
     - Parameters:
     - roomId: the room id
     - onComplete: completion handler
     - onError: callback that is fired if there is an error
     */
    func createGame(roomId: String,
                    _ onComplete: @escaping () -> Void,
                    _ onError: @escaping (Error) -> Void)
    
    /**
     Join a game that has been created on the network database
     - Parameters:
     - roomId: the room id
     - onComplete: completion handler
     - onError: callback that is fired if there is an error
     */
    func joinGame(roomId: String,
                  _ onComplete: @escaping () -> Void,
                  _ onError: @escaping (Error) -> Void)
    
    /**
     Listen to changes to the game reference.
     - Parameters:
     - gameId: the game id to be observed
     - onMonsterReceived: a callback that is fired every time monsters have been received (sent by the other player)
     - onGameStateChange: callback that is fired every time the game state of the other player changes
     - onError: error handler
     */
    func observeGameState(roomId: String,
                          _ onMonsterReceived: @escaping () -> Void,
                          _ onError: @escaping (Error) -> Void)
    
    /**
     Updates game boolean flag "has_ended" to the specified boolean value
     - Parameters:
     - gameId: the game id concerned
     - to: the boolean value for "has ended" flag
     - onComplete: a closure run when this process completes
     - onError: a closure run when an error occurs
     */
    func updateGameHasEnded(gameId: String,
                            to: Bool,
                            _ onComplete: @escaping () -> Void,
                            _ onError: @escaping (Error) -> Void)
    
    /**
     Updates game boolean flag "has_started" to the specified boolean value
     - Parameters:
     - gameId: the game id concerned
     - to: the boolean value for "has ended" flag
     - onComplete: a closure run when this process completes
     - onError: a closure run when an error occurs
     */
    func updateGameHasStarted(gameId: String,
                              to: Bool,
                              _ onComplete: @escaping () -> Void,
                              _ onError: @escaping (Error) -> Void)
    
    /**
     Closes the game with specified gameId
     - Parameters:
     - gameId: the game id concerned
     - onComplete: a closure run when this process completes
     - onError: a closure run when an error occurs
     */
    func closeGame(gameId: String,
                   _ onComplete: @escaping () -> Void,
                   _ onError: @escaping (Error) -> Void)

    // TODO: sendMonsters - need to determine way to represent monsters and convert to dictionary first
    // TODO: updateGameState - need to determine way of representing game state (actual rendering/image)
}