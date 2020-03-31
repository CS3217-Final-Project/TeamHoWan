//
//  EnemyTypeRealmModel.swift
//  GameOfRunes
//
//  Created by Jermy on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import RealmSwift

class EnemyTypeRealmModel: Object {
    // needs this wrapper as there is no such thing as optional element in Realm List
    let enemyType: RealmOptional<EnemyType> = .init()
    
    init(enemyType: EnemyType?) {
        self.enemyType.value = enemyType
    }
    
    required init() {
        super.init()
    }
}
