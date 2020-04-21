//
//  GameViewController.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    private var sceneManager: SceneManager!
    static let storage: Storage = RealmStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // temporary load here to reduce delay in starting game
        DispatchQueue.global(qos: .utility).async {
            // set up animation textures in background
            TextureContainer.loadTextures()
            print("Done loading textures")
        }
        
        // uncomment to reset install all the stages
        //Self.storage.reset()
        
        if Self.storage.isFirstInit {
            print("First-time initialisation of stages in database")
            Self.initStagesInDatabase()
            print("Done initialising stages")
        }

        if let view = view as? SKView {
            let gameStateMachine = GameStateMachine(
                states: [GameInPlayState(),
                         GameStartState(),
                         GamePauseState(),
                         GameEndState(),
                         GameStageSelectionState(),
                         GameModeSelectionState(),
                         MultiplayerGameInPlayState()]
            )
            view.isMultipleTouchEnabled = false
            sceneManager = .init(presentingView: view, gameStateMachine: gameStateMachine)
            gameStateMachine.sceneManager = sceneManager
            gameStateMachine.enter(GameModeSelectionState.self)
        }
    }

    override var shouldAutorotate: Bool {
        true
    }

    override var prefersStatusBarHidden: Bool {
        true
    }
}

// MARK: - Initialise Data in Realm Database
extension GameViewController {
    /**
     This function is called whenever the Realm database is empty (as determined
     by the `isFirstInit` property). This function will populate the Realm database
     with some default levels.
     */
    static func initStagesInDatabase() {
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
            achievement: .empty,
            isEndless: false
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
            achievement: .empty,
            isEndless: false
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
            achievement: .empty,
            isEndless: false
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
            achievement: .empty,
            isEndless: false
        )
        
        let stages = [stage1, stage2, stage3, stage4]
        Self.storage.save(stages: stages)
        Self.storage.didInitialise()
    }
}
