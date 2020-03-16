//
//  PlayerManaEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class PlayerManaEntity: Entity {
    override init() {
        super.init()
        
        addComponent(ManaComponent())
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func getType() -> EntityType {
        return .playerManaEntity
    }
}
