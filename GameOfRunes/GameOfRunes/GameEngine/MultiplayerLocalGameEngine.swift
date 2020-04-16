//
//  MultiplayerLocalGameEngine.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class MultiplayerLocalGameEngine: GameEngine {
    private let network: NetworkInterface = FirebaseNetwork()
    
    override func update(with deltaTime: TimeInterval) {
        super.update(with: deltaTime)
    }
}
