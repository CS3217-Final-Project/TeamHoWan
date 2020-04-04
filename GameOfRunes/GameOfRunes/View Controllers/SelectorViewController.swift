//
//  SelectorViewController.swift
//  GameOfRunes
//
//  Created by Andy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

class SelectorViewController: UIViewController {
    private var viewPortWidth: CGFloat {
        view.frame.size.width
    }
    private var viewPortHeight: CGFloat {
        view.frame.size.height
    }
    private let singlePlayerButton = UIButton()
    private let multiplayerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHomeBackground()
        setUpSinglePlayerButton()
        setUpMultiplayerButton()
    }
    
    private func setUpHomeBackground() {
        let background = UIImageView(image: UIImage(named: "relic-guardian"))
        background.contentMode = .scaleAspectFill
        
        view.addSubview(background)
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview().labeled("backgroundEdges")
        }
    }

    private func setUpSinglePlayerButton() {
        view.addSubview(singlePlayerButton)
        view.bringSubviewToFront(singlePlayerButton)
        addSpImageConstraints()
        addSpActions()
    }
    
    private func setUpMultiplayerButton() {
        view.addSubview(multiplayerButton)
        view.bringSubviewToFront(multiplayerButton)
        addMpImageConstraints()
        addMpActions()
    }
}

extension SelectorViewController {
    private func addSpImageConstraints() {
        guard let buttonImage = UIImage(named: "singleplayer") else {
            return
        }
        
        singlePlayerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().labeled("spButtonCenterX")
            make.centerY.equalToSuperview().multipliedBy(0.75).labeled("spButtonCenterY")
            make.size.equalTo(buttonImage.size.scaleTo(width: viewPortWidth * 0.7)).labeled("spButtonSize")
        }
        
        singlePlayerButton.adjustsImageWhenHighlighted = false
        singlePlayerButton.setBackgroundImage(buttonImage, for: .normal)
    }
    
    private func addMpImageConstraints() {
        guard let buttonImage = UIImage(named: "multiplayer") else {
            return
        }
        
        multiplayerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().labeled("spButtonCenterX")
            make.centerY.equalToSuperview().multipliedBy(1.45).labeled("spButtonCenterY")
            make.size.equalTo(buttonImage.size.scaleTo(width: viewPortWidth * 0.7)).labeled("spButtonSize")
        }
        
        multiplayerButton.adjustsImageWhenHighlighted = false
        multiplayerButton.setBackgroundImage(buttonImage, for: .normal)
    }
    
    private func addMpActions() {
        multiplayerButton.addTarget(self, action: #selector(onTapped), for: .touchDown)
        multiplayerButton.addTarget(self, action: #selector(onTouchedUpOutside), for: .touchUpOutside)
        multiplayerButton.addTarget(self, action: #selector(onMpStart), for: .touchUpInside)
    }
    
    private func addSpActions() {
        singlePlayerButton.addTarget(self, action: #selector(onTapped), for: .touchDown)
        singlePlayerButton.addTarget(self, action: #selector(onTouchedUpOutside), for: .touchUpOutside)
        singlePlayerButton.addTarget(self, action: #selector(onSpStart), for: .touchUpInside)
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
    
    @objc private func onMpStart(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform.identity
        }
        
        guard let multiplayerVC = storyboard?.instantiateViewController(identifier: "MultiplayerVC") else {
            return
        }
        
        multiplayerVC.modalPresentationStyle = .fullScreen
        multiplayerVC.modalTransitionStyle = .crossDissolve
        present(multiplayerVC, animated: true)
    }
    
    @objc private func onSpStart(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform.identity
        }
        
        guard let gameVC = storyboard?.instantiateViewController(identifier: "GameVC") else {
            return
        }
        
        gameVC.modalPresentationStyle = .fullScreen
        gameVC.modalTransitionStyle = .crossDissolve
        present(gameVC, animated: true)
    }
}
