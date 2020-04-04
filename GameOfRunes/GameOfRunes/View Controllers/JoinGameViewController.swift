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
        addImageConstraints()
        addJoinButtonActions()
    }
    
    private func setUpHomeBackground() {
        let background = UIImageView(image: UIImage(named: "relic-guardian"))
        background.contentMode = .scaleAspectFill
        
        view.addSubview(background)
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview().labeled("backgroundEdges")
        }
    }
    
    private func addImageConstraints() {
        guard let buttonImage = UIImage(named: "join-button") else {
            return
        }
        
        joinButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().labeled("joinButtonCenterX")
            make.centerY.equalToSuperview().multipliedBy(1.4).labeled("joinButtonCenterY")
            make.size.equalTo(buttonImage.size.scaleTo(width: view.frame.size.width * 0.7)).labeled("joinButtonSize")
        }
        
        joinButton.adjustsImageWhenHighlighted = false
        joinButton.setBackgroundImage(buttonImage, for: .normal)
    }
    
    private func addJoinButtonActions() {
        joinButton.addTarget(self, action: #selector(onTapped), for: .touchDown)
        joinButton.addTarget(self, action: #selector(onTouchedUpOutside), for: .touchUpOutside)
        joinButton.addTarget(self, action: #selector(onJoin), for: .touchUpInside)
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
        self.dbRef.joinGame(roomId: roomId, {
            // TODO: Error handler
            self.openLobbyView(db: self.dbRef, roomId: roomId, isHost: true)
        }, { err in
            
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
