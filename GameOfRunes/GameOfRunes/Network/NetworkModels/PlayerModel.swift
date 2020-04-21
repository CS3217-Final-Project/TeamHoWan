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
    let uid: String
    var name: String
    var isHost: Bool
    var isReady: Bool
    var avatar: String
    var toPlayer: Player {
        .init(uid: uid, name: name, avatar: Avatar.getAvatar(withName: avatar))
    }
    
    init(uid: String,
         isHost: Bool,
         name: String = "",
         isReady: Bool = false,
         avatar: String = FirebaseKeys.defaultAvatar) {
        self.uid = uid
        self.name = name
        self.isHost = isHost
        self.isReady = isReady
        self.avatar = avatar
    }
}
