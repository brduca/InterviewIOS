//
//  Position.swift
//  BoschInterviewIOS
//
//  Created by Salvador Mósca on 13/01/2021.
//

import Foundation

struct Position: Hashable
{
    var x: Int
    var y: Int
    
    static let initialPosition = Position(x: 0, y: 0)
    
    static func == (lhs: Position, rhs: Position) -> Bool
    {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    func move(_ direction: Direction) -> Position
    {
        switch direction
        {
        case .north:
            return Position(x: x, y: y - 1)
        case .south:
            return Position(x: x, y: y + 1)
        case .west:
            return Position(x: x + 1, y: y)
        case .east:
            return Position(x: x - 1, y: y)
        }
    }
}
