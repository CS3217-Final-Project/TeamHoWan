//
//  PlayerHealthEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class PlayerHealthEntity: Entity {
    override var type: EntityType {
        .playerHealthEntity
    }
    
    init(healthPoints: Int, healthBarNode: HealthBarNode) {
        super.init()

        let healthComponent = HealthComponent(healthPoints: healthPoints, healthBarNode: healthBarNode)
        addComponent(healthComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
