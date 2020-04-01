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
    private let _enemyType: RealmOptional<EnemyType> = .init()
    var enemyType: EnemyType? {
        get {
            _enemyType.value
        }
        // If the instance is already inserted into the db, updating must be done within a `write` block
        // see https://realm.io/docs/swift/latest/#updating-objects
        set {
            _enemyType.value = newValue
        }
    }
    
    init(enemyType: EnemyType?) {
        _enemyType.value = enemyType
    }
    
    required init() {
        super.init()
    }
}
