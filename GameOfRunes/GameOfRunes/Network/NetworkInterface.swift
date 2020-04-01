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
    func createRoom(withLevelNumber levelNum: Int,
                    _ onSuccess: @escaping (String) -> Void,
                    _ onError: @escaping (Error) -> Void)
    
    func joinRoom(forRoomId roomId: String,
                  _ onSuccess: @escaping () -> Void,
                  _ onRoomNotOpen: @escaping () -> Void,
                  _ onRoomNotExist: @escaping () -> Void,
                  _ onError: @escaping (Error) -> Void)
    
    func closeRoom(forRoomId roomId: String,
                   _ onComplete: @escaping () -> Void,
                   _ onError: @escaping (Error) -> Void)
    
    func leaveRoom(fromRoomId id: String,
                   _ onComplete: @escaping () -> Void,
                   _ onError: @escaping (Error) -> Void)
    
    func changeReadyState(forRoomId roomId: String,
                          _ onComplete: @escaping () -> Void,
                          _ onError: @escaping (Error) -> Void)
}
