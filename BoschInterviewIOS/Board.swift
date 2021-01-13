//
//  Board.swift
//  BoschInterviewIOS
//
//  Created by Salvador Mósca on 13/01/2021.
//

import Foundation

struct Board
{
    var rows: UInt
    var columns: UInt 
    
    // More than one character can be placed in the same position
    var charactersIndex: Dictionary<Position, [Character]> = [:]
    
    mutating func move(character: Character, to newPosition: Position)
    {
        // Bounds has been reached, simple just don't move character in this case
        guard isValidPosition(position: newPosition) else { return }
        
        // Removes from current position (if exists)
        if let currentPosition = character.currentPosition,
           let characters = charactersIndex[currentPosition]
        {
            charactersIndex[currentPosition] = characters.filter { $0.uuid != character.uuid }
        }
        
        // update position
        character.updateCurrentPosition(newPosition: newPosition)
        
        // Appends to charactersIndex
        if var characters = charactersIndex[newPosition]
        {
            characters.append(character)
            charactersIndex[newPosition] = characters
            return
        }
        
        charactersIndex[newPosition] = [character]
    }
    
    mutating func move(character: Character, direction: Direction)
    {
        // Does nothing when character is not placed on the board already
        guard let currentPosition = character.currentPosition else { return }
        move(character: character, to: currentPosition.move(direction))
    }
    
    func isValidPosition(position: Position) -> Bool
    {
        return position.x >= 0 && position.x < columns && position.y >= 0 && position.y < rows
    }
}
