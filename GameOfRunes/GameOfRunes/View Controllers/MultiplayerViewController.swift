//
//  MultiplayerViewController.swift
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
    
    // Does this need to be a singleton? Having too many references to the database?
    private let dbRef: NetworkInterface = FirebaseNetwork()
    
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
        addHostRoomImageConstraints()
        addHostRoomActions()
    }
    
    private func setUpJoinRoomButton() {
        view.addSubview(joinRoomButton)
        view.bringSubviewToFront(joinRoomButton)
        addJoinRoomImageConstraints()
        addJoinRoomActions()
    }
    
    private func addHostRoomImageConstraints() {
        guard let buttonImage = UIImage(named: "hostgame") else {
            return
        }
        
        hostRoomButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().labeled("hostRoomButtonCenterX")
            make.centerY.equalToSuperview().multipliedBy(0.75).labeled("hostRoomButtonCenterY")
            make.size.equalTo(buttonImage.size.scaleTo(width: viewPortWidth * 0.7)).labeled("hostRoomButtonSize")
        }
        
        hostRoomButton.adjustsImageWhenHighlighted = false
        hostRoomButton.setBackgroundImage(buttonImage, for: .normal)
    }
    
    private func addHostRoomActions() {
        hostRoomButton.addTarget(self, action: #selector(onTapped), for: .touchDown)
        hostRoomButton.addTarget(self, action: #selector(onTouchedUpOutside), for: .touchUpOutside)
        hostRoomButton.addTarget(self, action: #selector(hostRoomStart), for: .touchUpInside)
    }
    
    private func addJoinRoomImageConstraints() {
        guard let buttonImage = UIImage(named: "joingame") else {
            return
        }
        
        joinRoomButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().labeled("joinRoomButtonCenterX")
            make.centerY.equalToSuperview().multipliedBy(1.45).labeled("joinRoomButtonCenterY")
            make.size.equalTo(buttonImage.size.scaleTo(width: viewPortWidth * 0.7)).labeled("joinRoomButtonSize")
        }
        
        joinRoomButton.adjustsImageWhenHighlighted = false
        joinRoomButton.setBackgroundImage(buttonImage, for: .normal)
    }
    
    private func addJoinRoomActions() {
        joinRoomButton.addTarget(self, action: #selector(onTapped), for: .touchDown)
        joinRoomButton.addTarget(self, action: #selector(onTouchedUpOutside), for: .touchUpOutside)
        joinRoomButton.addTarget(self, action: #selector(joinRoomStart), for: .touchUpInside)
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
        // TODO: How to get UID and name?
        // TODO: Error handler
        dbRef.createRoom(uid: "123456", name: FirebaseKeys.defaultName, { roomId in
            self.openLobbyView(db: self.dbRef, roomId: roomId, isHost: true)
        }, { err in
            
        })
    }
    
    @objc private func joinRoomStart(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform.identity
        }
        openJoinGameView(db: self.dbRef)
    }
}
