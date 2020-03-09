//
//  TeamType.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

enum TeamType: String {
    case player
    case enemy
    
    var oppositeTeam: TeamType {
        switch self {
        case .player:
            return .enemy
        case .enemy:
            return .player
        }
    }
}
