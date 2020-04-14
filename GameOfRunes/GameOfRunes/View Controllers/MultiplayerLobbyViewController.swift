//
//  MultiplayerLobbyViewController.swift
//  GameOfRunes
//
//  Created by Andy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

class MultiplayerLobbyViewController: UIViewController {
    private var viewPortWidth: CGFloat {
        view.frame.size.width
    }
    private var viewPortHeight: CGFloat {
        view.frame.size.height
    }
    
    private var dbRef: NetworkInterface
    private var roomId: String
    
    private let roomIdLabel = UILabel()
    private let hostBox = UIView()
    private let clientBox = UIView()
    private let readyGameButton = UIButton()
    private var startGameButton: UIButton? // Start game button is only for the host
    private let leaveGameButton = UIButton()
    
    init(dbRef: NetworkInterface, roomId: String, isHost: Bool) {
        self.dbRef = dbRef
        self.roomId = roomId
        if isHost {
            self.startGameButton = UIButton()
        }
        super.init(nibName: nil, bundle: nil)
        setUpHomeBackground()
        setUpRoomIdLabel()
        setUpButtons()
    }
    
    private func setUpHomeBackground() {
        let background = UIImageView(image: UIImage(named: "relic-guardian"))
        background.contentMode = .scaleAspectFill
        
        view.addSubview(background)
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview().labeled("backgroundEdges")
        }
    }
    
    private func setUpRoomIdLabel() {
        roomIdLabel.font = UIFont(name: GameConfig.fontName, size: 50)
        roomIdLabel.textColor = .white
        roomIdLabel.backgroundColor = .black
        roomIdLabel.textAlignment = .center
        roomIdLabel.text = "Room Id: \(self.roomId)"
        
        view.addSubview(roomIdLabel)
        view.bringSubviewToFront(roomIdLabel)
        
        roomIdLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview().labeled("roomIdLabelButtonCenterX")
            make.centerY.equalToSuperview().multipliedBy(0.3).labeled("roomIdLabelButtonCenterY")
        }
    }
    
    private func setUpButtons() {
        UIViewController.setUpButton(view: view, button: readyGameButton, buttonImageName: "ready-game-button",
                                     viewPortWidth: viewPortWidth, xMultiplier: 0.3,
                                     yMultiplier: 1.8, sizeScale: 0.28)
        UIViewController.setUpButton(view: view, button: leaveGameButton, buttonImageName: "leave-game-button",
                                     viewPortWidth: viewPortWidth, xMultiplier: 1.7,
                                     yMultiplier: 1.8, sizeScale: 0.28)
        if let startGameButton = startGameButton {
            UIViewController.setUpButton(view: view, button: startGameButton,
                                         buttonImageName: "start-game-button", viewPortWidth: viewPortWidth,
                                         xMultiplier: 1.0, yMultiplier: 1.8, sizeScale: 0.28)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIViewController {
    func openLobbyView(db: NetworkInterface, roomId: String, isHost: Bool) {
        let multiplayerLobbyViewController = MultiplayerLobbyViewController(dbRef: db, roomId: roomId, isHost: isHost)
        multiplayerLobbyViewController.modalPresentationStyle = .fullScreen
        multiplayerLobbyViewController.modalTransitionStyle = .crossDissolve
        present(multiplayerLobbyViewController, animated: true, completion: nil)
    }
}
