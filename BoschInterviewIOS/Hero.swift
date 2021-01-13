//
//  Hero.swift
//  BoschInterviewIOS
//
//  Created by Salvador Mósca on 13/01/2021.
//

import Foundation

final class Hero: Character
{
    let uuid = UUID().uuidString
    let heroType: HeroType
    let name: String
    var item: Item?
    var currentPosition: Position?
    
    init(heroType: HeroType, name: String)
    {
        self.heroType = heroType
        self.name = name
    }
}
