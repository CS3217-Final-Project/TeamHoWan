//
//  EnemyWaveRealmModel.swift
//  GameOfRunes
//
//  Created by Jermy on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import RealmSwift

class EnemyWaveRealmModel: Object {
    private let _enemyWave: List<EnemyTypeRealmModel> = .init()
    var enemyWave: [EnemyType?] {
        _enemyWave.map { enemyTypeRealmModel in enemyTypeRealmModel.enemyType }
    }
    
    init(enemyWave: [EnemyType?]) {
        super.init()
        enemyWave.forEach { enemyType in _enemyWave.append(EnemyTypeRealmModel(enemyType: enemyType)) }
    }
    
    required init() {
        super.init()
    }
}
