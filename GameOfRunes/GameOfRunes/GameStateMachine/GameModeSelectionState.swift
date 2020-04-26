//
//  GameModeSelectionState.swift
//  GameOfRunes
//
//  Created by Jermy on 12/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

/** State for `GameStateMachine` when the player is selecting the game mode (Single/Multiplayer). */
class GameModeSelectionState: GKState {
    /** Checks for if the state to transition to is valid. */
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        stateClass is GameStageSelectionState.Type || stateClass is MultiplayerGameInPlayState.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        
        guard let gameStateMachine = stateMachine as? GameStateMachine,
            let sceneManager = gameStateMachine.sceneManager else {
                fatalError("No SceneManager associated with GameStateMachine")
        }
        
        if previousState is MultiplayerGameEndState {
            sceneManager.transitionToScene(
                sceneIdentifier: .home,
                transition: .doorsOpenHorizontal(withDuration: GameConfig.SceneManager.sceneTransitionDuration)
            )
            return
        }
        
        sceneManager.transitionToScene(sceneIdentifier: .home)
    }
}
