//
//  MultiplayerScreenViewController.swift
//  GameOfRunes
//
//  Created by Andy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

class MultiplayerScreenViewController: UIViewController {
    private var viewPortWidth: CGFloat {
        view.frame.size.width
    }
    private var viewPortHeight: CGFloat {
        view.frame.size.height
    }
    private let hostRoomButton = UIButton()
    private let joinRoomButton = UIButton()
    private let nameButton = UIButton()
    
    // TODO: Does this need to be a singleton?
    private let dbRef: NetworkInterface = FirebaseNetwork()
    private var playerData = PlayerData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHomeBackground()
        setUpHostRoomButton()
        setUpJoinRoomButton()
    }
    
    private func setUpHomeBackground() {
        let background = UIImageView(image: UIImage(named: "relic-guardian"))
        background.contentMode = .scaleAspectFill
        
        view.addSubview(background)
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview().labeled("backgroundEdges")
        }
    }
    
    private func setUpHostRoomButton() {
        view.addSubview(hostRoomButton)
        view.bringSubviewToFront(hostRoomButton)
        UIViewController.setUpButton(view: view, button: hostRoomButton, buttonImageName: "hostgame",
                                     viewPortWidth: viewPortWidth, xMultiplier: 1, yMultiplier: 0.75, sizeScale: 0.7)
        hostRoomButton.addTarget(self, action: #selector(onTapped), for: .touchDown)
        hostRoomButton.addTarget(self, action: #selector(onTouchedUpOutside), for: .touchUpOutside)
        hostRoomButton.addTarget(self, action: #selector(hostRoomStart), for: .touchUpInside)
    }
    
    private func setUpJoinRoomButton() {
        view.addSubview(joinRoomButton)
        view.bringSubviewToFront(joinRoomButton)
        UIViewController.setUpButton(view: view, button: joinRoomButton, buttonImageName: "joingame",
                                     viewPortWidth: viewPortWidth, xMultiplier: 1, yMultiplier: 1.45, sizeScale: 0.7)
        joinRoomButton.addTarget(self, action: #selector(onTapped), for: .touchDown)
        joinRoomButton.addTarget(self, action: #selector(onTouchedUpOutside), for: .touchUpOutside)
        joinRoomButton.addTarget(self, action: #selector(joinRoomStart), for: .touchUpInside)
    }
    
    private func setUpNameButton() {
        view.addSubview(nameButton)
        view.bringSubviewToFront(nameButton)
        
        // TODO: Create name button asset and set up button. Decide on how to allow user to input name.
//        UIViewController.setUpButton(view: view, button: nameButton, buttonImageName: "",
//                                     viewPortWidth: viewPortWidth, xMultiplier: 1, yMultiplier: 1.45, sizeScale: 0.7)
        nameButton.addTarget(self, action: #selector(onTapped), for: .touchDown)
        nameButton.addTarget(self, action: #selector(onTouchedUpOutside), for: .touchUpOutside)
        nameButton.addTarget(self, action: #selector(joinRoomStart), for: .touchUpInside)
    }
    
    @objc private func onTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.05) {
            sender.transform = CGAffineTransform(scaleX: 0.90, y: 0.9)
        }
    }
    
    @objc private func onTouchedUpOutside(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform.identity
        }
    }
    
    @objc private func hostRoomStart(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform.identity
        }
        // TODO: Error handler
        dbRef.createRoom(uid: playerData.uid, name: playerData.name, { roomId in
            self.openLobbyView(db: self.dbRef, roomId: roomId, isHost: true)
        }, { _ in
            
        })
    }
    
    @objc private func joinRoomStart(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform.identity
        }
        openJoinGameView(db: self.dbRef)
    }
}
