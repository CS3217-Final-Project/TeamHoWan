//
//  GameEndState.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

/** State for `GameStateMachine` when the Game has ended (either
 win or lose state has been reached) */
class GameEndState: GKState {
    // initialise with placeholder value
    var didWin = true
    var finalScore = 0
    
    /** Checks for if the state to transition to is valid. */
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        stateClass is GameStartState.Type || stateClass is GameSelectionState.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        
        guard let gameStateMachine = stateMachine as? GameStateMachine,
            let sceneManager = gameStateMachine.sceneManager else {
                fatalError("No SceneManager associated with GameStateMachine")
        }

        updateAndSaveStageData()
        sceneManager.transitionToScene(sceneIdentifier: .end(win: didWin))
    }

    /**
     Updates the data within the `Stage` struct for persisting.
     This is so that information can be persisted across games (e.g. a player's high score
     and best achievement level is remembered in the application)
     */
    func updateAndSaveStageData() {
        guard let gameStateMachine = stateMachine as? GameStateMachine,
            var stage = gameStateMachine.stage else {
            return
        }

        updateHighScore(stage: &stage)
        updateAchievementLevel(stage: &stage)

        HomeViewController.storage.save(stages: stage)
        //print(HomeViewController.storage.loadAllStages())
    }

    /** Will update player high score if current score is better than previous high score. */
    private func updateHighScore(stage: inout Stage) {
        if finalScore > stage.highScore {
            stage.highScore = finalScore
        }
    }

    /** Will update the player achievement level if current achievement level is better than previous one. */
    private func updateAchievementLevel(stage: inout Stage) {
        // Achievement Level will only be updated if player wins stage
        guard didWin else {
            return
        }

        var finalAchievementLevel: Stage.AchievementLevel
        if finalScore >= stage.achievementSMinScore {
            finalAchievementLevel = .S
        } else if finalScore >= stage.achievementAMinScore {
            finalAchievementLevel = .A
        } else if finalScore >= stage.achievementBMinScore {
            finalAchievementLevel = .B
        } else {
            finalAchievementLevel = .C
        }

        // Achievement Level will only be updated if player gets a better Achievement Level
        if stage.achievement < finalAchievementLevel {
            stage.achievement = finalAchievementLevel
        }
    }
}
