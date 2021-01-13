//
//  Bag.swift
//  BoschInterviewIOS
//
//  Created by Salvador Mósca on 13/01/2021.
//

import Foundation

final class Bag: Item
{
    // 6. Items can be weapons or a bag
    // Since a bag can't hold antoher bag it must be an array of weapons
    // If it can is just replace the array of Weapons for an [Item]
    private var items: [Weapon] = []
}

