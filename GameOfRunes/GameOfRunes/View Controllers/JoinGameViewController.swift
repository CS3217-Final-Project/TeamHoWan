//
//  JoinGameViewController.swift
//  GameOfRunes
//
//  Created by Andy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

class JoinGameViewController: UIViewController {
    private var dbRef: NetworkInterface
    private var codeInputVC = CodeInputViewController()
    private let joinButton = UIButton()

    init(dbRef: NetworkInterface) {
        self.dbRef = dbRef
        super.init(nibName: nil, bundle: nil)
        
        setUpHomeBackground()
        addChild(codeInputVC)
        view.addSubview(codeInputVC.view)
        view.bringSubviewToFront(codeInputVC.view)
        
        setUpJoinButton()
    }
    
    private func setUpJoinButton() {
        view.addSubview(joinButton)
        view.bringSubviewToFront(joinButton)
        UIViewController.setUpButton(view: view, button: joinButton, buttonImageName: "join-button",
                                     viewPortWidth: view.frame.size.width, xMultiplier: 1,
                                     yMultiplier: 1.4, sizeScale: 0.7)
        joinButton.addTarget(self, action: #selector(onJoin), for: .touchUpInside)
        joinButton.addTarget(self, action: #selector(onTapped), for: .touchDown)
        joinButton.addTarget(self, action: #selector(onTouchedUpOutside), for: .touchUpOutside)
    }
    
    private func setUpHomeBackground() {
        let background = UIImageView(image: UIImage(named: "relic-guardian"))
        background.contentMode = .scaleAspectFill
        
        view.addSubview(background)
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview().labeled("backgroundEdges")
        }
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
    
    @objc private func onJoin(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform.identity
        }
        let roomId = codeInputVC.codeInput.text ?? ""
        // TODO: Fill up handlers
        dbRef.joinRoom(uid: "123455", name: "XD", forRoomId: roomId, {
            self.openLobbyView(db: self.dbRef, roomId: roomId, isHost: false)
        }, {
            
        }, {
            
        }, { _ in
            
        })
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIViewController {
    func openJoinGameView(db: NetworkInterface) {
        let joinGameViewController = JoinGameViewController(dbRef: db)
        joinGameViewController.modalPresentationStyle = .fullScreen
        joinGameViewController.modalTransitionStyle = .crossDissolve
        present(joinGameViewController, animated: true, completion: nil)
    }
}
