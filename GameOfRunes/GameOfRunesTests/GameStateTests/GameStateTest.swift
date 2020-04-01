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
    var gameSelectionState: MockGameSelectionState!

    override func setUp() {
        super.setUp()
        gameInPlayState = MockGameInPlayState().withEnabledSuperclassSpy()
        gameStartState = MockGameStartState().withEnabledSuperclassSpy()
        gamePauseState = MockGamePauseState().withEnabledSuperclassSpy()
        gameEndState = MockGameEndState().withEnabledSuperclassSpy()
        gameSelectionState = MockGameSelectionState().withEnabledSuperclassSpy()
    }

    func testStartStateNextValidState() {
        XCTAssertTrue(gameStartState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGameStartState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGameSelectionState.self))
    }

    func testInPlayStateNextValidState() {
        XCTAssertFalse(gameInPlayState.isValidNextState(MockGameInPlayState.self))
        XCTAssertTrue(gameInPlayState.isValidNextState(MockGamePauseState.self))
        XCTAssertTrue(gameInPlayState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(gameInPlayState.isValidNextState(MockGameStartState.self))
        XCTAssertFalse(gameInPlayState.isValidNextState(MockGameSelectionState.self))
    }

    func testPauseStateNextValidState() {
        XCTAssertTrue(gamePauseState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockGameStartState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockGameSelectionState.self))
    }

    func testEndStateNextValidState() {
        XCTAssertFalse(gameEndState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gameEndState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gameEndState.isValidNextState(MockGameEndState.self))
        XCTAssertTrue(gameEndState.isValidNextState(MockGameStartState.self))
        XCTAssertTrue(gameEndState.isValidNextState(MockGameSelectionState.self))
    }
    
    func testSelectionStateNextValidState() {
        XCTAssertFalse(gameSelectionState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gameSelectionState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gameSelectionState.isValidNextState(MockGameEndState.self))
        XCTAssertTrue(gameSelectionState.isValidNextState(MockGameStartState.self))
        XCTAssertFalse(gameSelectionState.isValidNextState(MockGameSelectionState.self))
    }
}
