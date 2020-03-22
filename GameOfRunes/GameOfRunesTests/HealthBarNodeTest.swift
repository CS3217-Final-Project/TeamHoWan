//
//  HealthBarNodeTest.swift
//  GameOfRunesTests
//
//  Created by Jermy on 22/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import XCTest
@testable import GameOfRunes

class HealthBarNodeTest: XCTestCase {
    var sut: HealthBarNode!

    override func setUp() {
        super.setUp()
        sut = .init()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testDefaultInit() {
        XCTAssertEqual(sut.totalLives, 3)
        XCTAssertEqual(sut.livesLeft, 3)
    }
    
    func testCustomInit() {
        // negative value
        sut = .init(totalLives: -1)
        XCTAssertEqual(sut.totalLives, 1)
        XCTAssertEqual(sut.livesLeft, 1)
        
        // zero
        sut = .init(totalLives: 0)
        XCTAssertEqual(sut.totalLives, 1)
        XCTAssertEqual(sut.livesLeft, 1)
        
        // postive value
        sut = .init(totalLives: 5)
        XCTAssertEqual(sut.totalLives, 5)
        XCTAssertEqual(sut.livesLeft, 5)
    }
    
    func testChangeLivesLeft() {
        sut = .init()
        
        sut.livesLeft = 1
        XCTAssertEqual(sut.totalLives, 3)
        XCTAssertEqual(sut.livesLeft, 1)
        
        sut.livesLeft = 3
        XCTAssertEqual(sut.totalLives, 3)
        XCTAssertEqual(sut.livesLeft, 3)
        
        sut.livesLeft = 0
        XCTAssertEqual(sut.totalLives, 3)
        XCTAssertEqual(sut.livesLeft, 0)
        
        // negative value
        sut.livesLeft = -1
        XCTAssertEqual(sut.totalLives, 3)
        XCTAssertEqual(sut.livesLeft, 0)
        
        // > total lives
        sut.livesLeft = 5
        XCTAssertEqual(sut.totalLives, 3)
        XCTAssertEqual(sut.livesLeft, 3)
    }
    
    func testChangeTotalLives() {
        sut = .init()
            
        sut.totalLives = 5
        XCTAssertEqual(sut.totalLives, 5)
        XCTAssertEqual(sut.livesLeft, 3)
        sut.livesLeft = 5
        XCTAssertEqual(sut.totalLives, 5)
        XCTAssertEqual(sut.livesLeft, 5)
            
        sut.totalLives = 4
        XCTAssertEqual(sut.totalLives, 4)
        XCTAssertEqual(sut.livesLeft, 4)
        
        sut.livesLeft = 1
        sut.totalLives = 2
        XCTAssertEqual(sut.totalLives, 2)
        XCTAssertEqual(sut.livesLeft, 1)
        
        sut.totalLives = 0
        XCTAssertEqual(sut.totalLives, 1)
        XCTAssertEqual(sut.livesLeft, 1)
        
        sut.livesLeft = 0
        sut.totalLives = -1
        XCTAssertEqual(sut.totalLives, 1)
        XCTAssertEqual(sut.livesLeft, 0)
    }
}
