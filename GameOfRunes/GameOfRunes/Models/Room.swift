//
//  Room.swift
//  GameOfRunes
//
//  Created by Jermy on 17/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation

struct Room {
    var roomId: String?
    var isReady: Bool = false
    var localPlayerIsHost: Bool = false
    var localPlayer: Player?
    var remoteplayers: [Player] = []
}
