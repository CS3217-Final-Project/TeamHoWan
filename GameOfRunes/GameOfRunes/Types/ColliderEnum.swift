//
//  ColliderEnum.swift
//  GameOfRunes
//
//  Created by Andy on 26/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation

enum ColliderType: UInt32 {
    case enemy = 0b000001
    case endpoint = 0b000010
    case powerUp = 0b000100
}
