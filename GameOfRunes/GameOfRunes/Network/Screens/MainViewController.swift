//
//  ViewController.swift
//  WebRTC
//
//  Created by Stasel on 20/05/2018.
//  Copyright © 2018 Stasel. All rights reserved.
//

import UIKit
import AVFoundation
import WebRTC

class MainViewController: UIViewController {
  
  private let signalingClient: SignalingClient
  private let webRTCClient: WebRTCClient
  
  @IBOutlet private var speakerButton: UIButton?
  @IBOutlet private var signalingStatusLabel: UILabel?
  @IBOutlet private var localSdpStatusLabel: UILabel?
  @IBOutlet private var localCandidatesLabel: UILabel?
  @IBOutlet private var remoteSdpStatusLabel: UILabel?
  @IBOutlet private var remoteCandidatesLabel: UILabel?
  @IBOutlet private var muteButton: UIButton?
  @IBOutlet private var webRTCStatusLabel: UILabel?
  @IBOutlet private var personSegmentedControl: UISegmentedControl!
  
  private var currentPerson = ""
  private var oppositePerson = ""
  
  private var signalingConnected: Bool = false {
    didSet {
      DispatchQueue.main.async {
        if self.signalingConnected {
          self.signalingStatusLabel?.text = "Connected"
          self.signalingStatusLabel?.textColor = UIColor.green
        } else {
          self.signalingStatusLabel?.text = "Not connected"
          self.signalingStatusLabel?.textColor = UIColor.red
        }
      }
    }
  }
  
  private var hasLocalSdp: Bool = false {
    didSet {
      DispatchQueue.main.async {
        self.localSdpStatusLabel?.text = self.hasLocalSdp ? "✅" : "❌"
      }
    }
  }
  
  private var localCandidateCount: Int = 0 {
    didSet {
      DispatchQueue.main.async {
        self.localCandidatesLabel?.text = "\(self.localCandidateCount)"
      }
    }
  }
  
  private var hasRemoteSdp: Bool = false {
    didSet {
      DispatchQueue.main.async {
        self.remoteSdpStatusLabel?.text = self.hasRemoteSdp ? "✅" : "❌"
      }
    }
  }
  
  private var remoteCandidateCount: Int = 0 {
    didSet {
      DispatchQueue.main.async {
        self.remoteCandidatesLabel?.text = "\(self.remoteCandidateCount)"
      }
    }
  }
  
  private var speakerOn: Bool = false {
    didSet {
      let title = "Speaker: \(self.speakerOn ? "On" : "Off" )"
      self.speakerButton?.setTitle(title, for: .normal)
    }
  }
  
  private var mute: Bool = false {
    didSet {
      let title = "Mute: \(self.mute ? "on" : "off")"
      self.muteButton?.setTitle(title, for: .normal)
    }
  }
  
  init(signalClient: SignalingClient, webRTCClient: WebRTCClient) {
    self.signalingClient = signalClient
    self.webRTCClient = webRTCClient
    super.init(nibName: String(describing: MainViewController.self), bundle: Bundle.main)
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Video Chat"
    self.signalingConnected = false
    self.hasLocalSdp = false
    self.hasRemoteSdp = false
    self.localCandidateCount = 0
    self.remoteCandidateCount = 0
    self.speakerOn = false
    self.webRTCStatusLabel?.text = "New"
    
    self.webRTCClient.delegate = self
    self.signalingClient.delegate = self
    
  }
  
  @IBAction private func endCall(_ sender: Any) {
    self.signalingClient.deleteSdpAndCandidate(for: self.currentPerson)
    self.webRTCClient.closePeerConnection()
    
    self.webRTCClient.createPeerConnection()
    self.hasLocalSdp = false
    self.localCandidateCount = 0
    self.hasRemoteSdp = false
    self.remoteCandidateCount = 0
  }
  
  @IBAction private func offerDidTap(_ sender: UIButton) {
    self.webRTCClient.offer { sdp in
      self.hasLocalSdp = true
      self.signalingClient.send(sdp: sdp, to: self.oppositePerson)
    }
  }
  
  @IBAction private func personHasBeenSelected(_ sender: UISegmentedControl) {
    self.currentPerson = sender.titleForSegment(at: sender.selectedSegmentIndex)!.lowercased()
    self.oppositePerson = sender.titleForSegment(at: sender.selectedSegmentIndex == 0 ? 1 : 0)!.lowercased()
    
    self.signalingClient.listenSdp(from: self.currentPerson)
    self.signalingClient.listenCandidate(from: self.currentPerson)
  }
  
  @IBAction private func answerDidTap(_ sender: UIButton) {
    self.webRTCClient.answer { localSdp in
      self.hasLocalSdp = true
      self.signalingClient.send(sdp: localSdp, to: self.oppositePerson)
    }
  }
  
  @IBAction private func speakerDidTap(_ sender: UIButton) {
    if self.speakerOn {
      self.webRTCClient.speakerOff()
    } else {
      self.webRTCClient.speakerOn()
    }
    self.speakerOn.toggle()
  }
  
  @IBAction private func videoDidTap(_ sender: UIButton) {
    let vc = VideoViewController(webRTCClient: self.webRTCClient)
    self.present(vc, animated: true, completion: nil)
  }
  
  @IBAction private func muteDidTap(_ sender: UIButton) {
    self.mute.toggle()
    if self.mute {
      self.webRTCClient.muteAudio()
    } else {
      self.webRTCClient.unmuteAudio()
    }
  }
  
  @IBAction private func sendDataDidTap(_ sender: UIButton) {
    let alert = UIAlertController(title: "Send a message to the other peer",
                                  message: "This will be transferred over WebRTC data channel",
                                  preferredStyle: .alert)
    alert.addTextField { textField in
      textField.placeholder = "Message to send"
    }
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    alert.addAction(UIAlertAction(title: "Send", style: .default, handler: { [weak self, weak alert] _ in
      guard let dataToSend = alert?.textFields?.first?.text?.data(using: .utf8) else {
        return
      }
      self?.webRTCClient.sendData(dataToSend)
    }))
    self.present(alert, animated: true, completion: nil)
  }
}

extension MainViewController: SignalingClientDelegate {
  func signalClientDidConnect(_ signalClient: SignalingClient) {
    self.signalingConnected = true
  }
  
  func signalClientDidDisconnect(_ signalClient: SignalingClient) {
    self.signalingConnected = false
  }
  
  func signalClient(_ signalClient: SignalingClient, didReceiveRemoteSdp sdp: RTCSessionDescription) {
    print("Received remote sdp")
    self.webRTCClient.set(remoteSdp: sdp) { _ in
      self.hasRemoteSdp = true
    }
  }
  
  func signalClient(_ signalClient: SignalingClient, didReceiveCandidate candidate: RTCIceCandidate) {
    print("Received remote candidate")
      self.remoteCandidateCount += 1
      self.webRTCClient.set(remoteCandidate: candidate)
  }
}

extension MainViewController: WebRTCClientDelegate {
  
  func webRTCClient(_ client: WebRTCClient, didDiscoverLocalCandidate candidate: RTCIceCandidate) {
    print("discovered local candidate")
    self.localCandidateCount += 1
    self.signalingClient.send(candidate: candidate, to: self.oppositePerson)
  }
  
  func webRTCClient(_ client: WebRTCClient, didChangeConnectionState state: RTCIceConnectionState) {
    let textColor: UIColor
    switch state {
    case .connected, .completed:
      textColor = .green
    case .disconnected:
      textColor = .orange
    case .failed, .closed:
      textColor = .red
    case .new, .checking, .count:
      textColor = .black
    @unknown default:
      textColor = .black
    }
    DispatchQueue.main.async {
      self.webRTCStatusLabel?.text = state.description.capitalized
      self.webRTCStatusLabel?.textColor = textColor
    }
  }
  
  func webRTCClient(_ client: WebRTCClient, didReceiveData data: Data) {
    DispatchQueue.main.async {
      let message = String(data: data, encoding: .utf8) ?? "(Binary: \(data.count) bytes)"
      let alert = UIAlertController(title: "Message from WebRTC", message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
      self.present(alert, animated: true, completion: nil)
    }
  }
}
