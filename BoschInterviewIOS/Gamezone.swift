//
//  Gamezone.swift
//  BoschInterviewIOS
//
//  Created by Salvador Mósca on 13/01/2021.
//

import Foundation

/*
 Basic gameplay
 
 1. The player can select one of four hero types and give it a name.
 2. The hero will be placed in a gamezone.
 3. In the gamezone there can be other heroes and monsters.
 4. The heroes/monsters can move in four directions one field at a time
 (North,South,...).
 5. A hero can carry one item at a time.
 6. Items can be weapons or a bag.
 7. A bag can contain unlimited other items.
 */

final class Gamezone
{
    private var board = Board(rows: 100, columns: 100)
    
    func selectHeroType(heroType:HeroType, name: String)
    {
        let hero = Hero(heroType: heroType, name: name)
        placeInGamezone(character: hero)
    }
    
    func move(character: Character, direction: Direction)
    {
        board.move(character: character, direction: direction)
    }
    
    private func placeInGamezone(character: Character)
    {
        board.move(character: character, to: Position.initialPosition)
    }
}

