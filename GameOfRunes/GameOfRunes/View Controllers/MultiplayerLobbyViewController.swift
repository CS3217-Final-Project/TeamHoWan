//
//  MultiplayerLobbyViewController.swift
//  GameOfRunes
//
//  Created by Andy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

class MultiplayerLobbyViewController: UIViewController {
    private var dbRef: NetworkInterface
    private var roomId: String
    
    private let readyButton = UIButton()
    // Start game button is only for the host
    private var startGameButton: UIButton?
    private let leaveGameButton = UIButton()
    
    init(dbRef: NetworkInterface, roomId: String, isHost: Bool) {
        self.dbRef = dbRef
        self.roomId = roomId
        if isHost {
            self.startGameButton = UIButton()
        }
        super.init(nibName: nil, bundle: nil)
    }
    
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
