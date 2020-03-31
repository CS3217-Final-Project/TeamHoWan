//
//  EnemyWaveRealmModel.swift
//  GameOfRunes
//
//  Created by Jermy on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import RealmSwift

class EnemyWaveRealmModel: Object {
    var enemies: List<EnemyTypeRealmModel> = .init()
    
    init(enemyWave: [EnemyType?]) {
        super.init()
        enemyWave.forEach { enemy in enemies.append(EnemyTypeRealmModel(enemyType: enemy)) }
    }
    
    required init() {
        super.init()
    }
}
