//
//  EnemyTypeComponent.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class EnemyTypeComponent: GKComponent, Component {
    let enemyType: EnemyType
    var type: ComponentType {
        .enemyTypeComponent
    }
    
    init(_ enemyType: EnemyType) {
        self.enemyType = enemyType
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
