//
//  Character.swift
//  BoschInterviewIOS
//
//  Created by Salvador Mósca on 13/01/2021.
//

import Foundation

// Must be class in order support generic extension
protocol Character: class
{
    var uuid: String { get } // To avoid making the entire class Equatable I will compare ids
    var currentPosition: Position? { get set }
    func updateCurrentPosition(newPosition: Position)
}

extension Character 
{
    func updateCurrentPosition(newPosition: Position)
    {
        currentPosition = newPosition
    }
}
