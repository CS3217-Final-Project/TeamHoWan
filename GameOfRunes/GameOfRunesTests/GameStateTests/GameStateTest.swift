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

    override func setUp() {
        super.setUp()
        gameInPlayState = MockGameInPlayState().withEnabledSuperclassSpy()
        gameStartState = MockGameStartState().withEnabledSuperclassSpy()
        gamePauseState = MockGamePauseState().withEnabledSuperclassSpy()
        gameEndState = MockGameEndState().withEnabledSuperclassSpy()
        gameStageSelectionState = MockGameStageSelectionState().withEnabledSuperclassSpy()
        gameModeSelectionState = MockGameModeSelectionState().withEnabledSuperclassSpy()
    }

    func testStartStateNextValidState() {
        XCTAssertTrue(gameStartState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGameStartState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGameModeSelectionState.self))
    }

    func testInPlayStateNextValidState() {
        XCTAssertFalse(gameInPlayState.isValidNextState(MockGameInPlayState.self))
        XCTAssertTrue(gameInPlayState.isValidNextState(MockGamePauseState.self))
        XCTAssertTrue(gameInPlayState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(gameInPlayState.isValidNextState(MockGameStartState.self))
        XCTAssertFalse(gameInPlayState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertFalse(gameInPlayState.isValidNextState(MockGameModeSelectionState.self))
    }

    func testPauseStateNextValidState() {
        XCTAssertTrue(gamePauseState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockGameEndState.self))
        XCTAssertTrue(gamePauseState.isValidNextState(MockGameStartState.self))
        XCTAssertTrue(gamePauseState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockGameModeSelectionState.self))
    }

    func testEndStateNextValidState() {
        XCTAssertFalse(gameEndState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gameEndState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gameEndState.isValidNextState(MockGameEndState.self))
        XCTAssertTrue(gameEndState.isValidNextState(MockGameStartState.self))
        XCTAssertTrue(gameEndState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertFalse(gameEndState.isValidNextState(MockGameModeSelectionState.self))
    }
    
    func testStageSelectionStateNextValidState() {
        XCTAssertFalse(gameStageSelectionState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gameStageSelectionState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gameStageSelectionState.isValidNextState(MockGameEndState.self))
        XCTAssertTrue(gameStageSelectionState.isValidNextState(MockGameStartState.self))
        XCTAssertFalse(gameStageSelectionState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertFalse(gameStageSelectionState.isValidNextState(MockGameModeSelectionState.self))
    }
    
    func testModeSelectionStateNextValidState() {
        XCTAssertFalse(gameModeSelectionState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gameModeSelectionState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gameModeSelectionState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(gameModeSelectionState.isValidNextState(MockGameStartState.self))
        XCTAssertTrue(gameModeSelectionState.isValidNextState(MockGameStageSelectionState.self))
        XCTAssertFalse(gameModeSelectionState.isValidNextState(MockGameModeSelectionState.self))
    }
}
