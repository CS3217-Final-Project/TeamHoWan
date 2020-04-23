//
//  Util.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 17/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

class Util {
    /**
     Generates a random 5 digit number for roomId. This can generate duplicates and collisions can occur.
     */
    static func generateUuid() -> String {
        String(format: "%05d", Int.random(in: 0 ..< 100_000))
    }
}
