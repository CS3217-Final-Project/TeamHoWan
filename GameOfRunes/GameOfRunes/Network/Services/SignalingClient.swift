//
//  SignalingClient.swift
//  GameOfRunes
//
//  Created by Jermy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import WebRTC
import Firebase

class SignalingClient {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    weak var delegate: SignalClientDelegate?
    
    func deleteSdpAndCandidate(for person: String) {
        Firestore.firestore().collection(person).document("sdp").delete { err in
            if let err = err {
                print("Error removing firestore sdp: \(err)")
            } else {
                print("Firestore sdp successfully removed!")
            }
        }
        
        Firestore.firestore().collection(person).document("candidate").delete { err in
            if let err = err {
                print("Error removing firestore candidate: \(err)")
            } else {
                print("Firestore candidate successfully removed!")
            }
        }
    }
    
    func send(sdp rtcSdp: RTCSessionDescription, to person: String) {
        do {
            let dataMessage = try self.encoder.encode(SessionDescription(from: rtcSdp))
            let dict = try JSONSerialization.jsonObject(with: dataMessage, options: .allowFragments)
                as? [String: Any] ?? [:]
            Firestore.firestore().collection(person).document("sdp").setData(dict) { err in
                if let err = err {
                    print("Error send sdp: \(err)")
                } else {
                    print("Sdp sent!")
                }
            }
        } catch {
            debugPrint("Warning: Could not encode sdp: \(error)")
        }
    }
    
    func send(candidate rtcIceCandidate: RTCIceCandidate, to person: String) {
        do {
            let dataMessage = try self.encoder.encode(IceCandidate(from: rtcIceCandidate))
            let dict = try JSONSerialization.jsonObject(with: dataMessage, options: .allowFragments)
                as? [String: Any] ?? [:]
            Firestore.firestore()
                .collection(person)
                .document("candidate")
                .collection("candidates")
                .addDocument(data: dict) { err in
                    if let err = err {
                        print("Error send candidate: \(err)")
                    } else {
                        print("Candidate sent!")
                    }
                }
        } catch {
            debugPrint("Warning: Could not encode candidate: \(error)")
        }
    }
    
    func listenSdp(from person: String) {
        Firestore.firestore().collection(person).document("sdp")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching sdp: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Firestore sdp data was empty.")
                    return
                }
                print("Firestore sdp data: \(data)")
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    let sessionDescription = try self.decoder.decode(SessionDescription.self, from: jsonData)
                    self.delegate?.signalClient(self, didReceiveRemoteSdp: sessionDescription.rtcSessionDescription)
                } catch {
                    debugPrint("Warning: Could not decode sdp data: \(error)")
                    return
                }
            }
    }
    
    func listenCandidate(from person: String) {
        Firestore.firestore()
            .collection(person)
            .document("candidate")
            .collection("candidates")
            .addSnapshotListener { querySnapshot, err in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(err!)")
                    return
                }
                
                querySnapshot!.documentChanges.forEach { diff in
                    if diff.type == .added {
                        do {
                            let jsonData = try JSONSerialization
                                .data(withJSONObject: documents.first!.data(), options: .prettyPrinted)
                            let iceCandidate = try self.decoder.decode(IceCandidate.self, from: jsonData)
                            self.delegate?.signalClient(self, didReceiveCandidate: iceCandidate.rtcIceCandidate)
                        } catch {
                            debugPrint("Warning: Could not decode candidate data: \(error)")
                            return
                        }
                    }
                }
            }
    }
}
