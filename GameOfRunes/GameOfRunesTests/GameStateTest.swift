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

    override func setUp() {
        super.setUp()
        gameInPlayState = MockGameInPlayState().withEnabledSuperclassSpy()
        gameStartState = MockGameStartState().withEnabledSuperclassSpy()
        gamePauseState = MockGamePauseState().withEnabledSuperclassSpy()
        gameEndState = MockGameEndState().withEnabledSuperclassSpy()
    }

    func testStartStateNextValidState() {
        XCTAssertTrue(gameStartState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(gameStartState.isValidNextState(MockGameStartState.self))
    }

    func testInPlayStateNextValidState() {
        XCTAssertFalse(gameInPlayState.isValidNextState(MockGameInPlayState.self))
        XCTAssertTrue(gameInPlayState.isValidNextState(MockGamePauseState.self))
        XCTAssertTrue(gameInPlayState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(gameInPlayState.isValidNextState(MockGameStartState.self))
    }

    func testPauseStateNextValidState() {
        XCTAssertTrue(gamePauseState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockGameEndState.self))
        XCTAssertFalse(gamePauseState.isValidNextState(MockGameStartState.self))
    }

    func testEndStateNextValidState() {
        XCTAssertFalse(gameEndState.isValidNextState(MockGameInPlayState.self))
        XCTAssertFalse(gameEndState.isValidNextState(MockGamePauseState.self))
        XCTAssertFalse(gameEndState.isValidNextState(MockGameEndState.self))
        XCTAssertTrue(gameEndState.isValidNextState(MockGameStartState.self))
    }
}
