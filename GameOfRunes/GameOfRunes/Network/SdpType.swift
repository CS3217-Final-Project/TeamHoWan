//
//  SdpType.swift
//  GameOfRunes
//
//  Created by Jermy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import WebRTC

/** This enum is a swift wrapper over `RTCSdpType` for easy encode and decode */
enum SdpType: String, Codable {
    case offer
    case prAnswer
    case answer
    
    var rtcSdpType: RTCSdpType {
        switch self {
        case .offer:
            return .offer
        case .answer:
            return .answer
        case .prAnswer:
            return .prAnswer
        }
    }
}
