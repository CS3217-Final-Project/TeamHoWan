//
//  Team.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

enum Team {
    case player
    case enemy
    
    var oppositeTeam: Team {
        switch self {
        case .player:
            return .enemy
        case .enemy:
            return .player
        }
    }
}
