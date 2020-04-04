//
//  IceCandidate.swift
//  GameOfRunes
//
//  Created by Jermy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import WebRTC

/// This struct is a swift wrapper over `RTCIceCandidate` for easy encode and decode
struct IceCandidate: Codable {
    let sdp: String
    let sdpMLineIndex: Int32
    let sdpMid: String?
    
    init(from iceCandidate: RTCIceCandidate) {
        sdp = iceCandidate.sdp
        sdpMLineIndex = iceCandidate.sdpMLineIndex
        sdpMid = iceCandidate.sdpMid
    }
    
    var rtcIceCandidate: RTCIceCandidate {
        .init(sdp: sdp, sdpMLineIndex: sdpMLineIndex, sdpMid: sdpMid)
    }
}
