//
//  NetworkConfig.swift
//  GameOfRunes
//
//  Created by Jermy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

private let defaultIceServers = ["stun:stun.l.google.com:19302",
                                 "stun:stun1.l.google.com:19302",
                                 "stun:stun2.l.google.com:19302",
                                 "stun:stun3.l.google.com:19302",
                                 "stun:stun4.l.google.com:19302"]

struct NetworkConfig {
    let webRTCIceServers: [String]
    
    static let `default` = NetworkConfig(webRTCIceServers: defaultIceServers)
}
