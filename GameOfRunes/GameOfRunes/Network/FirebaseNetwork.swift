//
//  FirebaseNetwork.swift
//  GameOfRunes
//
//  Created by Andy on 1/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Firebase

class FirebaseNetwork: NetworkInterface {
    var observers: [Observer] = []
    
    func createRoom(_ onSuccess: @escaping (String) -> Void,
                    _ onError: @escaping (Error) -> Void) {
    }
    
    func joinRoom(forRoomId roomId: String,
                  _ onSuccess: @escaping () -> Void,
                  _ onRoomNotOpen: @escaping () -> Void,
                  _ onRoomNotExist: @escaping () -> Void,
                  _ onError: @escaping (Error) -> Void) {
    }
    
    func closeRoom(forRoomId roomId: String,
                   _ onComplete: @escaping () -> Void,
                   _ onError: @escaping (Error) -> Void) {
    }
    
    func leaveRoom(fromRoomId id: String,
                   _ onComplete: @escaping () -> Void,
                   _ onError: @escaping (Error) -> Void) {
    }
    
    func changeReadyState(forRoomId roomId: String,
                          _ onComplete: @escaping () -> Void,
                          _ onError: @escaping (Error) -> Void) {
    }
    
    func changeRoomOpenState(forRoomId id: String,
                             _ onComplete: @escaping () -> Void,
                             _ onError: @escaping (Error) -> Void) {
    }
        
    func observeRoomState(forRoomId id: String,
                          _ onDataChange: @escaping (RoomModel) -> Void,
                          _ onRoomClose: @escaping () -> Void,
                          _ onError: @escaping (Error) -> Void) {
    
    }
        
    func removeObservers() {
        
    }
}

struct Observer {
    var handle: DatabaseHandle
    var reference: DatabaseReference
    
    init(withHandle handle: DatabaseHandle, withRef reference: DatabaseReference) {
        self.handle = handle
        self.reference = reference
    }
}
