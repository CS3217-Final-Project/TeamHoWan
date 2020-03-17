//
//  PlayerManaEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class PlayerManaEntity: Entity {
    override var type: EntityType {
        .playerManaEntity
    }
    
    override init() {
        super.init()
        
        let manaComponent = ManaComponent(manaPoints: 0)
        addComponent(manaComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
