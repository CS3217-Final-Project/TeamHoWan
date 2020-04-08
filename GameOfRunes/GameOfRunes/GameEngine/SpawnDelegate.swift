//
//  SpawnSystem.swift
//  GameOfRunes
//
//  Created by Brian Yen on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

protocol SpawnDelegate: AnyObject {
    func updateSpawn(with deltaTime: TimeInterval)
    func startNextSpawnWave()
    func spawnPlayerUnitWave()
}
