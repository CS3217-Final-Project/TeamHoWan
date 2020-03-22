//
//  ManaBarNodeTest.swift
//  GameOfRunesTests
//
//  Created by Jermy on 22/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import XCTest
@testable import GameOfRunes

class ManaBarNodeTest: XCTestCase {
    var sut: ManaBarNode!

    override func setUp() {
        super.setUp()
        sut = .init()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testDefaultInit() {
        XCTAssertEqual(sut.totalManaPoints, 50)
        XCTAssertEqual(sut.currentManaPoints, 0)
        XCTAssertEqual(sut.manaPointsPerUnit, 10)
        XCTAssertEqual(sut.numManaUnits, 5)
    }
    
    func testCustomInit() {
        sut = .init(numManaUnits: 8, manaPointsPerUnit: 15, initialManaPoints: 20, manaColor: .black)
        XCTAssertEqual(sut.totalManaPoints, 120)
        XCTAssertEqual(sut.currentManaPoints, 20)
        XCTAssertEqual(sut.manaPointsPerUnit, 15)
        XCTAssertEqual(sut.numManaUnits, 8)
        
        // initial mana > total
        sut = .init(numManaUnits: 8, manaPointsPerUnit: 15, initialManaPoints: 140, manaColor: .black)
        XCTAssertEqual(sut.totalManaPoints, 120)
        XCTAssertEqual(sut.currentManaPoints, 120)
        XCTAssertEqual(sut.manaPointsPerUnit, 15)
        XCTAssertEqual(sut.numManaUnits, 8)
        
        // mana units <= 0
        sut = .init(numManaUnits: 0, manaPointsPerUnit: 15, initialManaPoints: 0, manaColor: .black)
        XCTAssertEqual(sut.totalManaPoints, 15)
        XCTAssertEqual(sut.currentManaPoints, 0)
        XCTAssertEqual(sut.manaPointsPerUnit, 15)
        XCTAssertEqual(sut.numManaUnits, 1)
        
        sut = .init(numManaUnits: -1, manaPointsPerUnit: 15, initialManaPoints: 0, manaColor: .black)
        XCTAssertEqual(sut.totalManaPoints, 15)
        XCTAssertEqual(sut.currentManaPoints, 0)
        XCTAssertEqual(sut.manaPointsPerUnit, 15)
        XCTAssertEqual(sut.numManaUnits, 1)
        
        // mana points per unit <= 0
        sut = .init(numManaUnits: 5, manaPointsPerUnit: 0, initialManaPoints: 0, manaColor: .black)
        XCTAssertEqual(sut.totalManaPoints, 5)
        XCTAssertEqual(sut.currentManaPoints, 0)
        XCTAssertEqual(sut.manaPointsPerUnit, 1)
        XCTAssertEqual(sut.numManaUnits, 5)
        
        sut = .init(numManaUnits: 5, manaPointsPerUnit: -1, initialManaPoints: 0, manaColor: .black)
        XCTAssertEqual(sut.totalManaPoints, 5)
        XCTAssertEqual(sut.currentManaPoints, 0)
        XCTAssertEqual(sut.manaPointsPerUnit, 1)
        XCTAssertEqual(sut.numManaUnits, 5)
    }
    
    func testChangeCurrentManaPoints() {
        sut.currentManaPoints = 20
        XCTAssertEqual(sut.currentManaPoints, 20)
        
        // > total mana
        sut.currentManaPoints = 60
        XCTAssertEqual(sut.currentManaPoints, 50)
        
        // < 0
        sut.currentManaPoints = -1
        XCTAssertEqual(sut.currentManaPoints, 0)
    }
    
    func testChangeTotalManaPoints() {
        sut.currentManaPoints = 50
        
        // current mana must be <= total mana
        sut.numManaUnits = 3
        XCTAssertEqual(sut.numManaUnits, 3)
        XCTAssertEqual(sut.totalManaPoints, 30)
        XCTAssertEqual(sut.currentManaPoints, 30)
        
        sut.manaPointsPerUnit = 5
        XCTAssertEqual(sut.manaPointsPerUnit, 5)
        XCTAssertEqual(sut.totalManaPoints, 15)
        XCTAssertEqual(sut.currentManaPoints, 15)
        
        // increasing total mana does not increase current mana
        sut.numManaUnits = 5
        XCTAssertEqual(sut.numManaUnits, 5)
        XCTAssertEqual(sut.totalManaPoints, 25)
        XCTAssertEqual(sut.currentManaPoints, 15)
        
        // mana points per unit <= 0
        sut.manaPointsPerUnit = 0
        XCTAssertEqual(sut.manaPointsPerUnit, 1)
        XCTAssertEqual(sut.totalManaPoints, 5)
        XCTAssertEqual(sut.currentManaPoints, 5)
        
        sut.manaPointsPerUnit = -1
        XCTAssertEqual(sut.manaPointsPerUnit, 1)
        XCTAssertEqual(sut.totalManaPoints, 5)
        XCTAssertEqual(sut.currentManaPoints, 5)
        
        // mana units <= 0
        sut.numManaUnits = 0
        XCTAssertEqual(sut.numManaUnits, 1)
        XCTAssertEqual(sut.totalManaPoints, 1)
        XCTAssertEqual(sut.currentManaPoints, 1)
        
        sut.currentManaPoints = 0
        sut.numManaUnits = -1
        XCTAssertEqual(sut.numManaUnits, 1)
        XCTAssertEqual(sut.totalManaPoints, 1)
        XCTAssertEqual(sut.currentManaPoints, 0)
    }
}
