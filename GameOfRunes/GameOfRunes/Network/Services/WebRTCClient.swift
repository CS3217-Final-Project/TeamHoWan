//
//  WebRTCClient.swift
//  GameOfRunes
//
//  Created by Jermy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import WebRTC

class WebRTCClient: NSObject {
  
  // The `RTCPeerConnectionFactory` is in charge of creating new RTCPeerConnection instances.
  // A new RTCPeerConnection should be created every new call, but the factory is shared.
  private static let factory: RTCPeerConnectionFactory = {
    RTCInitializeSSL()
    let videoEncoderFactory = RTCDefaultVideoEncoderFactory()
    let videoDecoderFactory = RTCDefaultVideoDecoderFactory()
    return RTCPeerConnectionFactory(encoderFactory: videoEncoderFactory, decoderFactory: videoDecoderFactory)
  }()
  
  weak var delegate: WebRTCClientDelegate?
  private var peerConnection: RTCPeerConnection?
  private let rtcAudioSession = RTCAudioSession.sharedInstance()
  private let audioQueue = DispatchQueue(label: "audio")
  private let mediaConstrains = [kRTCMediaConstraintsOfferToReceiveAudio: kRTCMediaConstraintsValueTrue,
                                 kRTCMediaConstraintsOfferToReceiveVideo: kRTCMediaConstraintsValueTrue]
  private var videoCapturer: RTCVideoCapturer?
  private var localVideoTrack: RTCVideoTrack?
  private var remoteVideoTrack: RTCVideoTrack?
  private var localDataChannel: RTCDataChannel?
  private var remoteDataChannel: RTCDataChannel?
  private var iceServers: [String]
  
  @available(*, unavailable)
  override init() {
    fatalError("WebRTCClient:init is unavailable")
  }
  
  required init(iceServers: [String]) {
    self.iceServers = iceServers
    super.init()
    createPeerConnection()
  }
  
  func createPeerConnection() {
    let config = RTCConfiguration()
    config.iceServers = [RTCIceServer(urlStrings: iceServers)]
    
    // Unified plan is more superior than planB
    config.sdpSemantics = .unifiedPlan
    
    // gatherContinually will let WebRTC to listen to any network changes and send any new
    // candidates to the other client
    config.continualGatheringPolicy = .gatherContinually
    
    let constraints = RTCMediaConstraints(
      mandatoryConstraints: nil,
      optionalConstraints: ["DtlsSrtpKeyAgreement": kRTCMediaConstraintsValueTrue])
    peerConnection = WebRTCClient.factory.peerConnection(with: config, constraints: constraints, delegate: self)
    
    createMediaSenders()
    configureAudioSession()
  }
  
  func closePeerConnection() {
    peerConnection?.close()
    peerConnection = nil
  }
  
  // MARK: - Signaling
  func offer(completion: @escaping (_ sdp: RTCSessionDescription) -> Void) {
    let constrains = RTCMediaConstraints(mandatoryConstraints: mediaConstrains, optionalConstraints: nil)
    peerConnection?.offer(for: constrains) { [weak self] sdp, _ in
      guard let sdp = sdp else {
        return
      }
      
      self?.peerConnection?.setLocalDescription(sdp, completionHandler: { _ in
        completion(sdp)
      })
    }
  }
  
  func answer(completion: @escaping (_ sdp: RTCSessionDescription) -> Void) {
    let constrains = RTCMediaConstraints(mandatoryConstraints: mediaConstrains, optionalConstraints: nil)
    self.peerConnection?.answer(for: constrains) { [weak self] sdp, _ in
      guard let sdp = sdp else {
        return
      }
      
      self?.peerConnection?.setLocalDescription(sdp, completionHandler: { _ in
        completion(sdp)
      })
    }
  }
  
  func set(remoteSdp: RTCSessionDescription, completion: @escaping (Error?) -> Void) {
    peerConnection?.setRemoteDescription(remoteSdp, completionHandler: completion)
  }
  
  func set(remoteCandidate: RTCIceCandidate) {
    peerConnection?.add(remoteCandidate)
  }
  
  // MARK: - Media
  func startCaptureLocalVideo(renderer: RTCVideoRenderer) {
    guard let capturer = videoCapturer as? RTCCameraVideoCapturer else {
      return
    }
    
    guard let frontCamera = (RTCCameraVideoCapturer.captureDevices().first { $0.position == .front }),
      // choose highest res
        let format = RTCCameraVideoCapturer.supportedFormats(for: frontCamera).max(by: {
            let width1 = CMVideoFormatDescriptionGetDimensions($0.formatDescription).width
            let width2 = CMVideoFormatDescriptionGetDimensions($1.formatDescription).width
            return width1 < width2
        }),
      // choose highest fps
        let fps = format.videoSupportedFrameRateRanges.max(by: { $0.maxFrameRate < $1.maxFrameRate }) else {
        return
    }
    
    capturer.startCapture(with: frontCamera,
                          format: format,
                          fps: Int(fps.maxFrameRate))
    
    localVideoTrack?.add(renderer)
  }
  
  func renderRemoteVideo(to renderer: RTCVideoRenderer) {
    remoteVideoTrack?.add(renderer)
  }
  
  private func configureAudioSession() {
    rtcAudioSession.lockForConfiguration()
    do {
      try rtcAudioSession.setCategory(AVAudioSession.Category.playAndRecord.rawValue)
      try rtcAudioSession.setMode(AVAudioSession.Mode.voiceChat.rawValue)
    } catch {
      debugPrint("Error changeing AVAudioSession category: \(error)")
    }
    rtcAudioSession.unlockForConfiguration()
  }
  
  private func createMediaSenders() {
    let streamId = "stream"
    
    // Audio
    let audioTrack = createAudioTrack()
    peerConnection?.add(audioTrack, streamIds: [streamId])
    
    // Video
    let videoTrack = createVideoTrack()
    localVideoTrack = videoTrack
    peerConnection?.add(videoTrack, streamIds: [streamId])
    remoteVideoTrack = peerConnection?.transceivers
        .first { $0.mediaType == .video }?.receiver.track as? RTCVideoTrack
    
    // Data
    if let dataChannel = createDataChannel() {
      dataChannel.delegate = self
      localDataChannel = dataChannel
    }
  }
  
  private func createAudioTrack() -> RTCAudioTrack {
    let audioConstrains = RTCMediaConstraints(mandatoryConstraints: nil, optionalConstraints: nil)
    let audioSource = WebRTCClient.factory.audioSource(with: audioConstrains)
    let audioTrack = WebRTCClient.factory.audioTrack(with: audioSource, trackId: "audio0")
    return audioTrack
  }
  
  private func createVideoTrack() -> RTCVideoTrack {
    let videoSource = WebRTCClient.factory.videoSource()
    
    #if TARGET_OS_SIMULATOR
    videoCapturer = RTCFileVideoCapturer(delegate: videoSource)
    #else
    videoCapturer = RTCCameraVideoCapturer(delegate: videoSource)
    #endif
    
    let videoTrack = WebRTCClient.factory.videoTrack(with: videoSource, trackId: "video0")
    return videoTrack
  }
  
  // MARK: Data Channels
  private func createDataChannel() -> RTCDataChannel? {
    let config = RTCDataChannelConfiguration()
    guard let dataChannel = peerConnection?.dataChannel(forLabel: "WebRTCData", configuration: config) else {
      debugPrint("Warning: Couldn't create data channel.")
      return nil
    }
    return dataChannel
  }
  
  func sendData(_ data: Data) {
    let buffer = RTCDataBuffer(data: data, isBinary: true)
    remoteDataChannel?.sendData(buffer)
  }
}

extension WebRTCClient: RTCPeerConnectionDelegate {
  
  func peerConnection(_ peerConnection: RTCPeerConnection, didChange stateChanged: RTCSignalingState) {
    debugPrint("peerConnection new signaling state: \(stateChanged)")
  }
  
  func peerConnection(_ peerConnection: RTCPeerConnection, didAdd stream: RTCMediaStream) {
    debugPrint("peerConnection did add stream")
  }
  
  func peerConnection(_ peerConnection: RTCPeerConnection, didRemove stream: RTCMediaStream) {
    debugPrint("peerConnection did remove stream")
  }
  
  func peerConnectionShouldNegotiate(_ peerConnection: RTCPeerConnection) {
    debugPrint("peerConnection should negotiate")
  }
  
  func peerConnection(_ peerConnection: RTCPeerConnection, didChange newState: RTCIceConnectionState) {
    debugPrint("peerConnection new connection state: \(newState)")
    self.delegate?.webRTCClient(self, didChangeConnectionState: newState)
  }
  
  func peerConnection(_ peerConnection: RTCPeerConnection, didChange newState: RTCIceGatheringState) {
    debugPrint("peerConnection new gathering state: \(newState)")
  }
  
  func peerConnection(_ peerConnection: RTCPeerConnection, didGenerate candidate: RTCIceCandidate) {
    self.delegate?.webRTCClient(self, didDiscoverLocalCandidate: candidate)
  }
  
  func peerConnection(_ peerConnection: RTCPeerConnection, didRemove candidates: [RTCIceCandidate]) {
    debugPrint("peerConnection did remove candidate(s)")
  }
  
  func peerConnection(_ peerConnection: RTCPeerConnection, didOpen dataChannel: RTCDataChannel) {
    debugPrint("peerConnection did open data channel")
    self.remoteDataChannel = dataChannel
  }
}

// MARK: - Audio control
extension WebRTCClient {
  func muteAudio() {
    setAudioEnabled(false)
  }
  
  func unmuteAudio() {
    setAudioEnabled(true)
  }
  
  // Fallback to the default playing device: headphones/bluetooth/ear speaker
  func speakerOff() {
    audioQueue.async { [weak self] in
      guard let self = self else {
        return
      }
      
      self.rtcAudioSession.lockForConfiguration()
      do {
        try self.rtcAudioSession.setCategory(AVAudioSession.Category.playAndRecord.rawValue)
        try self.rtcAudioSession.overrideOutputAudioPort(.none)
      } catch {
        debugPrint("Error setting AVAudioSession category: \(error)")
      }
      self.rtcAudioSession.unlockForConfiguration()
    }
  }
  
  // Force speaker
  func speakerOn() {
    audioQueue.async { [weak self] in
      guard let self = self else {
        return
      }
      
      self.rtcAudioSession.lockForConfiguration()
      do {
        try self.rtcAudioSession.setCategory(AVAudioSession.Category.playAndRecord.rawValue)
        try self.rtcAudioSession.overrideOutputAudioPort(.speaker)
        try self.rtcAudioSession.setActive(true)
      } catch {
        debugPrint("Couldn't force audio to speaker: \(error)")
      }
      self.rtcAudioSession.unlockForConfiguration()
    }
  }
  
  private func setAudioEnabled(_ isEnabled: Bool) {
    let audioTracks = peerConnection?.transceivers.compactMap { $0.sender.track as? RTCAudioTrack }
    audioTracks?.forEach { $0.isEnabled = isEnabled }
  }
}

extension WebRTCClient: RTCDataChannelDelegate {
  func dataChannelDidChangeState(_ dataChannel: RTCDataChannel) {
    debugPrint("dataChannel did change state: \(dataChannel.readyState)")
  }
  
  func dataChannel(_ dataChannel: RTCDataChannel, didReceiveMessageWith buffer: RTCDataBuffer) {
    delegate?.webRTCClient(self, didReceiveData: buffer.data)
  }
}
