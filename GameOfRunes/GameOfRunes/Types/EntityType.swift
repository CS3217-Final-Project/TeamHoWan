//
//  EntityType.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 13/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

enum EntityType: CaseIterable {
    case enemyEntity
    case gestureEntity
    case playerEntity
    case endPointEntity
    case droppedManaEntity
    case timerEntity
    case icePrisonPowerUpEntity
    case hellFirePowerUpEntity
    case darkVortexPowerUpEntity
    case comboEntity
    case attractionEntity
    
    static var powerUps: [EntityType] {
        [.icePrisonPowerUpEntity, .hellFirePowerUpEntity, .darkVortexPowerUpEntity]
    }
    
    var isPowerUp: Bool {
        Self.powerUps.contains(self)
    }
}
