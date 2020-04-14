//
//  PlayerData.swift
//  GameOfRunes
//
//  Created by Andy on 9/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation

/**
 Represents the Player's data locally. It stores the player's name and generates the player's UUID.
 */
class PlayerData {
    var name: String = FirebaseKeys.defaultName
    let uid: String = UUID().uuidString
    
    func setName(name: String) {
        self.name = name
    }
}
