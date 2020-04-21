//
//  GameStateMachineTest.swift
//  GameOfRunesTests
//
//  Created by Brian Yen on 22/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import XCTest
import Cuckoo
import SpriteKit
import GameplayKit
@testable import GameOfRunes

class GameStateMachineTest: BaseUnitTest {
    var gameInPlayState: MockGameInPlayState!
    var gameStartState: MockGameStartState!
    var gamePauseState: MockGamePauseState!
    var gameEndState: MockGameEndState!
    var gameStageSelectionState: MockGameStageSelectionState!
    var gameModeSelectionState: MockGameModeSelectionState!
    var multiplayerGameInPlayState: MockMultiplayerGameInPlayState!
    var multiplayerGameEndState: MockMultiplayerGameEndState!
    var sceneManager: MockSceneManager!
 
    override func setUp() {
        super.setUp()
        gameInPlayState = MockGameInPlayState().withEnabledSuperclassSpy()
        gameStartState = MockGameStartState().withEnabledSuperclassSpy()
        gamePauseState = MockGamePauseState().withEnabledSuperclassSpy()
        gameEndState = MockGameEndState().withEnabledSuperclassSpy()
        gameStageSelectionState = MockGameStageSelectionState().withEnabledSuperclassSpy()
        gameModeSelectionState = MockGameModeSelectionState().withEnabledSuperclassSpy()
        multiplayerGameInPlayState = MockMultiplayerGameInPlayState().withEnabledSuperclassSpy()
        multiplayerGameEndState = MockMultiplayerGameEndState().withEnabledSuperclassSpy()

        gameStateMachine = MockGameStateMachine(states: [gameInPlayState,
                                                         gameStartState,
                                                         gamePauseState,
                                                         gameEndState,
                                                         gameStageSelectionState,
                                                         gameModeSelectionState,
                                                         multiplayerGameInPlayState,
                                                         multiplayerGameEndState]
        ).withEnabledSuperclassSpy()
        
        sceneManager = MockSceneManager(
            presentingView: SKView(frame: .init(origin: .zero, size: .init(width: 2_000, height: 2_000))),
            gameStateMachine: gameStateMachine
        ).withEnabledSuperclassSpy()
        gameStateMachine.sceneManager = sceneManager
        gameStateMachine.stage = testStage
        gameStateMachine.avatar = testAvatar
        gameStateMachine.room = testRoom
    }

    func testStartState() {
        gameStateMachine.enter(MockGameStartState.self)
        verify(gameStartState, times(1)).didEnter(from: any(GKState.self))
        verify(sceneManager, times(1)).loadNewStage()
    }

    func testInPlayState() {
        gameStateMachine.enter(MockGameInPlayState.self)
        verify(gameInPlayState, times(1)).didEnter(from: any(GKState.self))
        verify(sceneManager, times(1)).transitionToScene(
            sceneIdentifier: any(SceneManager.SceneIdentifier.self),
            transition: any(SKTransition.self))
    }

    func testPauseState() {
        gameStateMachine.enter(MockGamePauseState.self)
        verify(gamePauseState, times(1)).didEnter(from: any(GKState.self))
        verify(sceneManager, times(1)).transitionToScene(
            sceneIdentifier: any(SceneManager.SceneIdentifier.self),
            transition: any(SKTransition.self))
    }

    func testEndState() {
        gameStateMachine.enter(MockGameEndState.self)
        verify(gameEndState, times(1)).didEnter(from: any(GKState.self))
        verify(sceneManager, times(1)).transitionToScene(
            sceneIdentifier: any(SceneManager.SceneIdentifier.self),
            transition: any(SKTransition.self))
    }
    
    func testStageSelectionState() {
        gameStateMachine.enter(MockGameStageSelectionState.self)
        verify(gameStageSelectionState, times(1)).didEnter(from: any(GKState.self))
        verify(sceneManager, times(1)).transitionToScene(
            sceneIdentifier: any(SceneManager.SceneIdentifier.self),
            transition: any(SKTransition.self))
    }
    
    func testModeSelectionState() {
        gameStateMachine.enter(MockGameModeSelectionState.self)
        verify(gameModeSelectionState, times(1)).didEnter(from: any(GKState.self))
        verify(sceneManager, times(1)).transitionToScene(
            sceneIdentifier: any(SceneManager.SceneIdentifier.self),
            transition: any(SKTransition.self))
    }
    
    func testMultiplayerInPlayState() {
        gameStateMachine.enter(MockMultiplayerGameInPlayState.self)
        verify(multiplayerGameInPlayState, times(1)).didEnter(from: any(GKState.self))
        verify(sceneManager, times(1)).transitionToScene(
            sceneIdentifier: any(SceneManager.SceneIdentifier.self),
            transition: any(SKTransition.self))
    }
    
    func testMultiplayerEndState() {
        gameStateMachine.enter(MockMultiplayerGameEndState.self)
        verify(multiplayerGameEndState, times(1)).didEnter(from: any(GKState.self))
        verify(sceneManager, times(1)).transitionToScene(
            sceneIdentifier: any(SceneManager.SceneIdentifier.self),
            transition: any(SKTransition.self))
    }
}
