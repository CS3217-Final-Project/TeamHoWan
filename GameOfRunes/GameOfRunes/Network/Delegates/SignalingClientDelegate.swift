//
//  SignalingClientDelegate.swift
//  GameOfRunes
//
//  Created by Jermy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import WebRTC

protocol SignalClientDelegate: AnyObject {
  func signalClientDidConnect(_ signalClient: SignalingClient)
  func signalClientDidDisconnect(_ signalClient: SignalingClient)
  func signalClient(_ signalClient: SignalingClient, didReceiveRemoteSdp sdp: RTCSessionDescription)
  func signalClient(_ signalClient: SignalingClient, didReceiveCandidate candidate: RTCIceCandidate)
}
