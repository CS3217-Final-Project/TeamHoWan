//
//  HomeViewController.swift
//  GameOfRunes
//
//  Created by Jermy on 25/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit
import AVFoundation
import SnapKit
import RealmSwift

class HomeViewController: UIViewController {
    private var viewPortWidth: CGFloat {
        view.frame.size.width
    }
    private var viewPortHeight: CGFloat {
        view.frame.size.height
    }
    private let startButton = UIButton()
    // TODO: Perhaps shift it to some other static class? Or no need make static?
    static let storage: Storage = RealmStorage()
    private var bgmPlayer = AVAudioPlayer()
    private var clickSoundPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHomeBackground()
        setUpGameIcon()
        setUpStartButton()
        setUpAudioPlayer(audioPlayer: &bgmPlayer, filename: "Destiny-Ablaze", type: "mp3", loopCount: -1)
        setUpAudioPlayer(audioPlayer: &clickSoundPlayer, filename: "click3", type: "mp3")
        
        // temporary load here to reduce delay in starting game
        DispatchQueue.global(qos: .utility).async {
            // set up animation textures in background
            TextureContainer.loadTextures()
            print("Done loading textures")
        }
        
        // uncomment to reset install all the stages
        // Self.storage.reset()
        
        if Self.storage.isFirstInit {
            //TODO: DEBUG
            print("this is the first init")
            initStagesInDatabase()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        bgmPlayer.volume = 1.0
        bgmPlayer.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        bgmPlayer.setVolume(0.0, fadeDuration: 1.0)
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
    
    private func setUpAudioPlayer(
        audioPlayer: inout AVAudioPlayer,
        filename: String,
        type: String,
        loopCount: Int = 0
    ) {
        guard let filePath = Bundle.main.path(forResource: filename, ofType: type) else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePath))
            audioPlayer.numberOfLoops = loopCount
        } catch {
            print("\(filename).\(type) not available :(")
        }
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
        clickSoundPlayer.play()
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
        
        guard let selectorVC = storyboard?.instantiateViewController(identifier: "SelectorVC") else {
            return
        }
        
        selectorVC.modalPresentationStyle = .fullScreen
        selectorVC.modalTransitionStyle = .crossDissolve
        present(selectorVC, animated: true)
    }
}

// MARK: - Initialise Data in Realm Database
extension HomeViewController {
    /**
     This function is called whenever the Realm database is empty (as determined
     by the `isFirstInit` property). This function will populate the Realm database
     with some default levels.
     */
    func initStagesInDatabase() {
        guard let stage1EnemyWaveData = try? EnemyWaveCreator.getStageEnemyWaveDataAndSpawnInterval(stageNumber: 1),
            let stage2EnemyWaveData = try? EnemyWaveCreator.getStageEnemyWaveDataAndSpawnInterval(stageNumber: 2),
            let stage3EnemyWaveData = try? EnemyWaveCreator.getStageEnemyWaveDataAndSpawnInterval(stageNumber: 3),
            let stage4EnemyWaveData = try? EnemyWaveCreator.getStageEnemyWaveDataAndSpawnInterval(stageNumber: 4) else {
            print("Unable to load Enemies from EnemyWaveCreator")
            return
        }

        let stage1 = Stage(
            name: "The Beginning",
            chapter: "Peasant Land 1",
            category: .normal,
            relativePositionRatioInMap: (x: 0.6, y: -0.55),
            arena: .arena1,
            difficulty: 100,
            numWaves: stage1EnemyWaveData.0.count,
            enemyWaves: stage1EnemyWaveData.0,
            enemyWaveSpawnInterval: stage1EnemyWaveData.1,
            achievementBMinScore: 10,
            achievementAMinScore: 40,
            achievementSMinScore: 50,
            achievement: .empty
        )

        let stage2 = Stage(
            name: "Warrior Arena",
            chapter: "Peasant Land 2",
            category: .normal,
            relativePositionRatioInMap: (x: 0.17, y: -0.43),
            arena: .arena1,
            difficulty: 200,
            numWaves: stage2EnemyWaveData.0.count,
            enemyWaves: stage2EnemyWaveData.0,
            enemyWaveSpawnInterval: stage2EnemyWaveData.1,
            achievementBMinScore: 20,
            achievementAMinScore: 50,
            achievementSMinScore: 70,
            achievement: .empty
        )

        let stage3 = Stage(
            name: "Cathedral Mayhem",
            chapter: "Peasant Land 3",
            category: .normal,
            relativePositionRatioInMap: (x: 0.66, y: -0.28),
            arena: .arena1,
            difficulty: 300,
            numWaves: stage3EnemyWaveData.0.count,
            enemyWaves: stage3EnemyWaveData.0,
            enemyWaveSpawnInterval: stage3EnemyWaveData.1,
            achievementBMinScore: 30,
            achievementAMinScore: 70,
            achievementSMinScore: 90,
            achievement: .empty
        )

        let stage4 = Stage(
            name: "The Crossing",
            chapter: "Peasant Land 4",
            category: .boss,
            relativePositionRatioInMap: (x: 0.25, y: -0.22),
            arena: .arena1,
            difficulty: 500,
            numWaves: stage4EnemyWaveData.0.count,
            enemyWaves: stage4EnemyWaveData.0,
            enemyWaveSpawnInterval: stage4EnemyWaveData.1,
            achievementBMinScore: 50,
            achievementAMinScore: 80,
            achievementSMinScore: 100,
            achievement: .empty
        )

        let stages = [stage1, stage2, stage3, stage4]
        Self.storage.save(stages: stages)
        Self.storage.didInitialise()
    }
}
