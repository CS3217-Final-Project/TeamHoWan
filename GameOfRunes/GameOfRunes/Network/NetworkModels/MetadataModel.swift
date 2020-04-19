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
    
    init(playerHealth: Int, playerMana: Int) {
        self.playerHealth = playerHealth
        self.playerMana = playerMana
    }
    
    init(_ metadata: GameMetaData) {
        self.playerHealth = metadata.playerHealth
        self.playerMana = metadata.playerMana
    }
}
