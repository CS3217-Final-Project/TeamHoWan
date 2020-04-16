////
////  HomeViewController.swift
////  GameOfRunes
////
////  Created by Jermy on 25/3/20.
////  Copyright © 2020 TeamHoWan. All rights reserved.
////
//
//import UIKit
//import AVFoundation
//import SnapKit
//
//class HomeViewController: UIViewController {
//    private var viewPortWidth: CGFloat {
//        view.frame.size.width
//    }
//    private var viewPortHeight: CGFloat {
//        view.frame.size.height
//    }
//    private let startButton = UIButton()
//    // TODO: Need to make soundPlayer accessible by more view controllers
//    private var bgmPlayer = AVAudioPlayer()
//    private var clickSoundPlayer = AVAudioPlayer()
//
//    // TODO: Get rid of this after Jeremy is done with FrontEnd for Multiplayer
//    private let multiplayerButton = UIButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUpHomeBackground()
//        setUpGameIcon()
//        setUpStartButton()
//        setUpAudioPlayer(audioPlayer: &bgmPlayer, filename: "Destiny-Ablaze", type: "mp3", loopCount: -1)
//        setUpAudioPlayer(audioPlayer: &clickSoundPlayer, filename: "click3", type: "mp3")
//
//        // TODO: Get rid of this during code finalisation
//        setUpMultiplayerButton()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        bgmPlayer.volume = 1.0
//        bgmPlayer.play()
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        bgmPlayer.setVolume(0.0, fadeDuration: 1.0)
//    }
//
//    private func setUpHomeBackground() {
//        let background = UIImageView(image: UIImage(named: "relic-guardian"))
//        background.contentMode = .scaleAspectFill
//
//        view.addSubview(background)
//        background.snp.makeConstraints { make in
//            make.edges.equalToSuperview().labeled("backgroundEdges")
//        }
//    }
//
//    private func setUpGameIcon() {
//        let gameIcon = UIImageView(image: UIImage(named: "GameOfRunes-logo-transparent"))
//        gameIcon.contentMode = .scaleAspectFit
//
//        view.addSubview(gameIcon)
//        view.bringSubviewToFront(gameIcon)
//        gameIcon.snp.makeConstraints { make in
//            make.centerX.equalToSuperview().labeled("gameIconCenterX")
//            make.centerY.equalToSuperview().multipliedBy(0.75).labeled("gameIconCenterY")
//            make.size.equalTo(gameIcon.frame.size.scaleTo(width: viewPortWidth * 0.8)).labeled("gameIconSize")
//        }
//    }
//
//    private func setUpStartButton() {
//        view.addSubview(startButton)
//        view.bringSubviewToFront(startButton)
//        UIViewController.setUpButton(view: view, button: startButton, buttonImageName: "start-button-glow",
//                                     viewPortWidth: viewPortWidth, xMultiplier: 1, yMultiplier: 1.6, sizeScale: 0.8)
//        addActions()
//    }
//
//    private func setUpAudioPlayer(
//        audioPlayer: inout AVAudioPlayer,
//        filename: String,
//        type: String,
//        loopCount: Int = 0
//    ) {
//        guard let filePath = Bundle.main.path(forResource: filename, ofType: type) else {
//            return
//        }
//
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePath))
//            audioPlayer.numberOfLoops = loopCount
//        } catch {
//            print("\(filename).\(type) not available :(")
//        }
//    }
//}
//
//// MARK: - button setup
//extension HomeViewController {
//    private func addImageConstraints() {
//        guard let buttonImage = UIImage(named: "start-button-glow") else {
//            return
//        }
//
//        startButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview().labeled("startButtonCenterX")
//            make.centerY.equalToSuperview().multipliedBy(1.6).labeled("startButtonCenterY")
//            make.size.equalTo(buttonImage.size.scaleTo(width: viewPortWidth * 0.8)).labeled("startButtonSize")
//        }
//
//        startButton.adjustsImageWhenHighlighted = false
//        startButton.setBackgroundImage(buttonImage, for: .normal)
//    }
//
//    private func addActions() {
//        startButton.addTarget(self, action: #selector(onTapped), for: .touchDown)
//        startButton.addTarget(self, action: #selector(onTouchedUpOutside), for: .touchUpOutside)
//        startButton.addTarget(self, action: #selector(onSelectedStart), for: .touchUpInside)
//    }
//
//    @objc private func onSelectedStart(_ sender: UIButton) {
//        UIView.animate(withDuration: 0.1) {
//            sender.transform = CGAffineTransform.identity
//        }
//
//        guard let selectorVC = storyboard?.instantiateViewController(identifier: "SelectorVC") else {
//            return
//        }
//
//        selectorVC.modalPresentationStyle = .fullScreen
//        selectorVC.modalTransitionStyle = .crossDissolve
//        present(selectorVC, animated: true)
//    }
//
//    @objc private func onTapped(_ sender: UIButton) {
//        UIView.animate(withDuration: 0.05) {
//            sender.transform = CGAffineTransform(scaleX: 0.90, y: 0.9)
//        }
//        clickSoundPlayer.play()
//    }
//
//    @objc private func onTouchedUpOutside(_ sender: UIButton) {
//        UIView.animate(withDuration: 0.1) {
//            sender.transform = CGAffineTransform.identity
//        }
//    }
//}
//
//extension UIViewController {
//    static func setUpButton(view: UIView,
//                            button: UIButton,
//                            buttonImageName: String,
//                            viewPortWidth: CGFloat,
//                            xMultiplier: Double,
//                            yMultiplier: Double,
//                            sizeScale: Double) {
//        guard let buttonImage = UIImage(named: buttonImageName) else {
//            return
//        }
//
//        view.addSubview(button)
//        view.bringSubviewToFront(button)
//
//        button.snp.makeConstraints { make in
//            make.centerX.equalToSuperview().multipliedBy(xMultiplier)
//            make.centerY.equalToSuperview().multipliedBy(yMultiplier)
//            make.size.equalTo(buttonImage.size.scaleTo(width: viewPortWidth * CGFloat(sizeScale)))
//        }
//
//        button.adjustsImageWhenHighlighted = false
//        button.setBackgroundImage(buttonImage, for: .normal)
//    }
//
//}
//
//// TODO: For temporary Multiplayer Button: Get rid of this after UI For Multiplayer is done
//extension HomeViewController {
//    private func setUpMultiplayerButton() {
//        view.addSubview(multiplayerButton)
//        view.bringSubviewToFront(multiplayerButton)
//        multiplayerButton.setTitle("Multiplayer", for: .normal)
//
//        multiplayerButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview().labeled("multiplayerButtonCenterX")
//            make.centerY.equalToSuperview().multipliedBy(1.8).labeled("multiplayerButtonCenterY")
//        }
//
//        multiplayerButton.addTarget(self, action: #selector(multiplayerButtonTapped), for: .touchDown)
//        multiplayerButton.addTarget(self, action: #selector(multiplayerButtonTouchUpOutside), for: .touchUpOutside)
//        multiplayerButton.addTarget(self, action: #selector(multiplayerButtonTouchUpInside), for: .touchUpInside)
//    }
//
//    @objc private func multiplayerButtonTapped(_ sender: UIButton) {
//        UIView.animate(withDuration: 0.05) {
//            sender.transform = CGAffineTransform(scaleX: 0.90, y: 0.9)
//        }
//        clickSoundPlayer.play()
//    }
//
//    @objc private func multiplayerButtonTouchUpOutside(_ sender: UIButton) {
//        UIView.animate(withDuration: 0.1) {
//            sender.transform = CGAffineTransform.identity
//        }
//    }
//
//    @objc private func multiplayerButtonTouchUpInside(_ sender: UIButton) {
//        UIView.animate(withDuration: 0.1) {
//            sender.transform = CGAffineTransform.identity
//        }
//
//        guard let multiplayerGameVC = storyboard?.instantiateViewController(identifier: "MultiplayerGameVC") else {
//            return
//        }
//
//        multiplayerGameVC.modalPresentationStyle = .fullScreen
//        multiplayerGameVC.modalTransitionStyle = .crossDissolve
//        present(multiplayerGameVC, animated: true)
//    }
//}
