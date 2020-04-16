//
//  MetadataModel.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 16/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation

class MetadataModel: Codable {
    var playerHealth: Int
    var playerMana: Int
    var avatar: String
    
    init(playerHealth: Int, playerMana: Int, avatar: String) {
        self.playerHealth = playerHealth
        self.playerMana = playerMana
        self.avatar = avatar
    }
}
