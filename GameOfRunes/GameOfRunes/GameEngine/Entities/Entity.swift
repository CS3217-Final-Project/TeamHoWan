//
//  Entity.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 15/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class Entity: GKEntity {
    func getType() -> EntityType {
        fatalError("Base Entity getType() not supported.")
    }
}
