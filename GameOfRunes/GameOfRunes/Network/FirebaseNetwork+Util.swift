//
//  FirebaseNetwork+Util.swift
//  GameOfRunes
//
//  Created by Andy on 1/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation

extension FirebaseNetwork {
    /**
        Generates a random 5 digit number for roomId. This can generate duplicates and collisions can occur.
     */
    func generateRandomId() -> String {
         var random: String = String(Int.random(in: 0 ..< 1000000))
         while random.count < 6 {
             random = "0\(random)"
         }
         
         return random
     }
}
