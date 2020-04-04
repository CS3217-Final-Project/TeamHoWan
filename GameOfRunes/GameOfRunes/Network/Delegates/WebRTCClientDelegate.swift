//
//  WebRTCClientDelegate.swift
//  GameOfRunes
//
//  Created by Jermy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import WebRTC

protocol WebRTCClientDelegate: AnyObject {
  func webRTCClient(_ client: WebRTCClient, didDiscoverLocalCandidate candidate: RTCIceCandidate)
  func webRTCClient(_ client: WebRTCClient, didChangeConnectionState state: RTCIceConnectionState)
  func webRTCClient(_ client: WebRTCClient, didReceiveData data: Data)
}
