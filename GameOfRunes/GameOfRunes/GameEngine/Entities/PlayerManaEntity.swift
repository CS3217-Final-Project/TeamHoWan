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
    
    init(manaPoints: Int, manaBarNode: ManaBarNode) {
        super.init()
        
        let manaComponent = ManaComponent(manaPoints: manaPoints, manaBarNode: manaBarNode)
        addComponent(manaComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
