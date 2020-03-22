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
    var sceneManager: MockSceneManager!

    override func setUp() {
        super.setUp()
        gameInPlayState = MockGameInPlayState().withEnabledSuperclassSpy()
        gameStartState = MockGameStartState().withEnabledSuperclassSpy()
        gamePauseState = MockGamePauseState().withEnabledSuperclassSpy()
        gameEndState = MockGameEndState().withEnabledSuperclassSpy()

        gameStateMachine = MockGameStateMachine(states: [gameInPlayState,
                                                         gameStartState,
                                                         gamePauseState,
                                                         gameEndState]
        ).withEnabledSuperclassSpy()

        sceneManager = MockSceneManager(presentingView: SKView(), gameStateMachine: gameStateMachine).withEnabledSuperclassSpy()
        gameStateMachine.sceneManager = sceneManager
    }

    func testStartState() {
        gameStateMachine.enter(MockGameStartState.self)
        verify(gameStartState, times(1)).didEnter(from: any(GKState.self))
        verify(sceneManager, times(1)).restartGame()
    }

    func testInPlayState() {
        gameStateMachine.enter(MockGameInPlayState.self)
        verify(gameInPlayState, times(1)).didEnter(from: any(GKState.self))
        verify(sceneManager, times(1)).transitionToScene(sceneIdentifier: any(SceneManager.SceneIdentifier.self))
    }

    func testPauseState() {
        gameStateMachine.enter(MockGamePauseState.self)
        verify(gamePauseState, times(1)).didEnter(from: any(GKState.self))
        verify(sceneManager, times(1)).transitionToScene(sceneIdentifier: any(SceneManager.SceneIdentifier.self))
    }

    func testEndState() {
        gameStateMachine.enter(MockGameEndState.self)
        verify(gameEndState, times(1)).didEnter(from: any(GKState.self))
        verify(sceneManager, times(1)).transitionToScene(sceneIdentifier: any(SceneManager.SceneIdentifier.self))
    }
}
