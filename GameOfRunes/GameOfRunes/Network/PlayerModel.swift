//
//  PlayerModel.swift
//  GameOfRunes
//
//  Created by Andy on 1/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

/**
 Model representing a Player on the network.
 */
class PlayerModel: Codable {
    var uid: String
    var name: String
    var isHost: Bool
    var isReady: Bool
    var powerUpActivated: PowerUpModel?
    var monsters: [MonsterModel]
    
    init(uid: String, name: String = FirebaseKeys.defaultEmptyString, isHost: Bool,
         isReady: Bool = false, powerUp: PowerUpModel? = nil, monsters: [MonsterModel] = []) {
        self.uid = uid
        self.name = name
        self.isHost = isHost
        self.isReady = isReady
        self.powerUpActivated = powerUp
        self.monsters = monsters
    }
}
