//
//  SessionDescription.swift
//  GameOfRunes
//
//  Created by Jermy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import WebRTC

/** This struct is a swift wrapper over `RTCSessionDescription` for easy encode and decode */
struct SessionDescription: Codable {
    let sdp: String
    let type: SdpType
    
    init(from rtcSessionDescription: RTCSessionDescription) {
        sdp = rtcSessionDescription.sdp
        
        switch rtcSessionDescription.type {
        case .offer:
            type = .offer
        case .prAnswer:
            type = .prAnswer
        case .answer:
            type = .answer
        default:
            fatalError("Unknown RTCSessionDescription type: \(rtcSessionDescription.type.rawValue)")
        }
    }
    
    var rtcSessionDescription: RTCSessionDescription {
        .init(type: type.rtcSdpType, sdp: sdp)
    }
}
