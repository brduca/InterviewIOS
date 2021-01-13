//
//  BoschInterviewIOSTests.swift
//  BoschInterviewIOSTests
//
//  Created by Salvador Mósca on 13/01/2021.
//

import XCTest
@testable import BoschInterviewIOS

class BoschInterviewIOSTests: XCTestCase
{
    func testInitialMoveInBoard() throws
    {
        var board = Board(rows: 100, columns: 100)
        let hero = Hero(heroType: .heroType1, name: "Name")
        board.move(character: hero, to: Position.initialPosition)
        
        XCTAssertNotNil(board.charactersIndex[Position.initialPosition]!.first { $0.uuid == hero.uuid })
    }

    func testValidPosition() throws
    {
        let board = Board(rows: 100, columns: 100)
        XCTAssert(board.isValidPosition(position: Position(x: 50, y: 50)))
        XCTAssertFalse(board.isValidPosition(position: Position(x: -50, y: -50)))
        XCTAssertFalse(board.isValidPosition(position: Position(x: 101, y: 100)))
    }
    
    func testWrongPlacementInBoard() throws
    {
        var board = Board(rows: 100, columns: 100)
        let hero = Hero(heroType: .heroType1, name: "Name")
        board.move(character: hero, to: Position(x: 101, y: 101))
        
        XCTAssert(hero.currentPosition == nil)
    }
    
    func testNewPostionInBoard() throws
    {
        var board = Board(rows: 100, columns: 100)
        let newPosition = Position(x: 1, y: 1)
        let hero = Hero(heroType: .heroType1, name: "Name")
        board.move(character: hero, to: Position.initialPosition)
        board.move(character: hero, to: newPosition)
        
        // Hero is no longer in initial position
        XCTAssertNil(board.charactersIndex[Position.initialPosition]!.first { $0.uuid == hero.uuid })
        
        // Hero is in new position
        XCTAssertNotNil(board.charactersIndex[newPosition]!.first { $0.uuid == hero.uuid })
    }
    
    func testNewDirectionInBoard() throws
    {
        var board = Board(rows: 100, columns: 100)
        let hero = Hero(heroType: .heroType1, name: "Name")
        board.move(character: hero, to: Position.initialPosition)
        let newPosition = hero.currentPosition!.move(.south)
        
        board.move(character: hero, direction: .south)
        
        // Hero is no longer in initial position
        XCTAssertNil(board.charactersIndex[Position.initialPosition]!.first { $0.uuid == hero.uuid })
        
        // Hero is in new position
        XCTAssertNotNil(board.charactersIndex[newPosition]!.first { $0.uuid == hero.uuid })
    }
    
    func testNewInvalidDirectionInBoard() throws
    {
        var board = Board(rows: 100, columns: 100)
        let hero = Hero(heroType: .heroType1, name: "Name")
        board.move(character: hero, to: Position.initialPosition)
        board.move(character: hero, direction: .north)
        
        // Hero still in initial position
        XCTAssertNotNil(board.charactersIndex[Position.initialPosition]!.first { $0.uuid == hero.uuid })
    }
    
    func testPosition() throws
    {
        let position = Position(x: 0, y: 0)
        let newPosition = position.move(.south)
        
        // Hero is no longer in initial position
        XCTAssert(newPosition.x == 0)
        XCTAssert(newPosition.y == 1)
    }
}
