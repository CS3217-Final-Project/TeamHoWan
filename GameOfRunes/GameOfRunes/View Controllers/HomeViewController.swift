//
//  HomeViewController.swift
//  GameOfRunes
//
//  Created by Jermy on 25/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private var viewPortWidth: CGFloat {
        view.frame.size.width
    }
    private var viewPortHeight: CGFloat {
        view.frame.size.height
    }
    private let startButton = UIButton()
    // TODO: Perhaps make it static?
    private let storage: Storage = RealmStorage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpHomeBackground()
        setUpGameIcon()
        setUpStartButton()
        
        // temporary load here to reduce delay in starting game
        DispatchQueue.global(qos: .default).async {
            // set up animation textures in background
            TextureContainer.loadTextures()
            print("Done loading textures")
        }
    }
    
    private func setUpHomeBackground() {
        let background = UIImageView(image: UIImage(named: "relic-guardian"))
        background.contentMode = .scaleAspectFill
        
        view.addSubview(background)
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview().labeled("backgroundEdges")
        }
    }
    
    private func setUpGameIcon() {
        let gameIcon = UIImageView(image: UIImage(named: "GameOfRunes-logo-transparent"))
        gameIcon.contentMode = .scaleAspectFit
        
        view.addSubview(gameIcon)
        view.bringSubviewToFront(gameIcon)
        gameIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview().labeled("gameIconCenterX")
            make.centerY.equalToSuperview().multipliedBy(0.75).labeled("gameIconCenterY")
            make.size.equalTo(gameIcon.frame.size.scaleTo(width: viewPortWidth * 0.8)).labeled("gameIconSize")
        }
    }
    
    private func setUpStartButton() {
        view.addSubview(startButton)
        view.bringSubviewToFront(startButton)
        addImageConstraints()
        addActions()
    }
}

// MARK: - button setup
extension HomeViewController {
    private func addImageConstraints() {
        guard let buttonImage = UIImage(named: "start-button-glow") else {
            return
        }
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().labeled("startButtonCenterX")
            make.centerY.equalToSuperview().multipliedBy(1.6).labeled("startButtonCenterY")
            make.size.equalTo(buttonImage.size.scaleTo(width: viewPortWidth * 0.8)).labeled("startButtonSize")
        }
        
        startButton.adjustsImageWhenHighlighted = false
        startButton.setBackgroundImage(buttonImage, for: .normal)
    }
    
    private func addActions() {
        startButton.addTarget(self, action: #selector(onTapped), for: .touchDown)
        startButton.addTarget(self, action: #selector(onTouchedUpOutside), for: .touchUpOutside)
        startButton.addTarget(self, action: #selector(onSelectedStart), for: .touchUpInside)
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
    
    @objc private func onSelectedStart(_ sender: UIButton) {
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
