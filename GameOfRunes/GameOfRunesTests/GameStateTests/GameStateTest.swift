//
//  GameStateTest.swift
//  GameOfRunesTests
//
//  Created by Brian Yen on 22/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import XCTest
@testable import GameOfRunes

class GameStateTest: BaseUnitTest {
    var gameInPlayState: MockGameInPlayState!
    var gameStartState: MockGameStartState!
    var gamePauseState: MockGamePauseState!
    var gameEndState: MockGameEndState!
    var gameStageSelectionState: MockGameStageSelectionState!
    var gameModeSelectionState: MockGameModeSelectionState!
    var multiplayerGameInPlayState: MockMultiplayerGameInPlayState!
    var multiplayerGameEndState: MockMultiplayerGameEndState!

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
    }

    func testStartStateNextValidState() {
        XCTAssertTrue(gameStartState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGameStartState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGameModeSelectionState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockMultiplayerGameInPlayState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockMultiplayerGameEndState.self))
    }

    func testInPlayStateNextValidState() {
        XCTAssertFalse(gameInPlayState.isValidNextState(MockGameInPlayState.self))
        XCTAssertTrue(gameInPlayState.isValidNextState(MockGamePauseState.self))
        XCTAssertTrue(gameInPlayState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(gameInPlayState.isValidNextState(MockGameStartState.self))
        XCTAssertFalse(gameInPlayState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertFalse(gameInPlayState.isValidNextState(MockGameModeSelectionState.self))
        XCTAssertFalse(gameInPlayState.isValidNextState(MockMultiplayerGameInPlayState.self))
        XCTAssertFalse(gameInPlayState.isValidNextState(MockMultiplayerGameEndState.self))
    }

    func testPauseStateNextValidState() {
        XCTAssertTrue(gamePauseState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockGameEndState.self))
        XCTAssertTrue(gamePauseState.isValidNextState(MockGameStartState.self))
        XCTAssertTrue(gamePauseState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockGameModeSelectionState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockMultiplayerGameInPlayState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockMultiplayerGameEndState.self))
    }

    func testEndStateNextValidState() {
        XCTAssertFalse(gameEndState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gameEndState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gameEndState.isValidNextState(MockGameEndState.self))
        XCTAssertTrue(gameEndState.isValidNextState(MockGameStartState.self))
        XCTAssertTrue(gameEndState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertFalse(gameEndState.isValidNextState(MockGameModeSelectionState.self))
        XCTAssertFalse(gameEndState.isValidNextState(MockMultiplayerGameInPlayState.self))
        XCTAssertFalse(gameEndState.isValidNextState(MockMultiplayerGameEndState.self))
    }
    
    func testStageSelectionStateNextValidState() {
        XCTAssertFalse(gameStageSelectionState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gameStageSelectionState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gameStageSelectionState.isValidNextState(MockGameEndState.self))
        XCTAssertTrue(gameStageSelectionState.isValidNextState(MockGameStartState.self))
        XCTAssertFalse(gameStageSelectionState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertTrue(gameStageSelectionState.isValidNextState(MockGameModeSelectionState.self))
        XCTAssertFalse(gameStageSelectionState.isValidNextState(MockMultiplayerGameInPlayState.self))
        XCTAssertFalse(gameStageSelectionState.isValidNextState(MockMultiplayerGameEndState.self))
    }
    
    func testModeSelectionStateNextValidState() {
        XCTAssertFalse(gameModeSelectionState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gameModeSelectionState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gameModeSelectionState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(gameModeSelectionState.isValidNextState(MockGameStartState.self))
        XCTAssertTrue(gameModeSelectionState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertFalse(gameModeSelectionState.isValidNextState(MockGameModeSelectionState.self))
        XCTAssertTrue(gameModeSelectionState.isValidNextState(MockMultiplayerGameInPlayState.self))
        XCTAssertFalse(gameModeSelectionState.isValidNextState(MockMultiplayerGameEndState.self))
    }
    
    func testMultiplayerInPlayStateNextValidState() {
        XCTAssertFalse(multiplayerGameInPlayState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(multiplayerGameInPlayState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(multiplayerGameInPlayState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(multiplayerGameInPlayState.isValidNextState(MockGameStartState.self))
        XCTAssertFalse(multiplayerGameInPlayState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertFalse(multiplayerGameInPlayState.isValidNextState(MockGameModeSelectionState.self))
        XCTAssertFalse(multiplayerGameInPlayState.isValidNextState(MockMultiplayerGameInPlayState.self))
        XCTAssertTrue(multiplayerGameInPlayState.isValidNextState(MockMultiplayerGameEndState.self))
    }
    
    func testMultiplayerEndStateNextValidState() {
        XCTAssertFalse(multiplayerGameEndState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(multiplayerGameEndState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(multiplayerGameEndState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(multiplayerGameEndState.isValidNextState(MockGameStartState.self))
        XCTAssertFalse(multiplayerGameEndState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertTrue(multiplayerGameEndState.isValidNextState(MockGameModeSelectionState.self))
        XCTAssertFalse(multiplayerGameEndState.isValidNextState(MockMultiplayerGameInPlayState.self))
        XCTAssertFalse(multiplayerGameEndState.isValidNextState(MockMultiplayerGameEndState.self))
    }
}
