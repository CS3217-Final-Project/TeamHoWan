//
//  ManaSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class ManaSystem: GKComponentSystem<ManaComponent>, System {
    override init() {
        super.init(componentClass: ManaComponent.self)
    }
}
