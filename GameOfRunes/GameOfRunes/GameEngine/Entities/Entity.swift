//
//  Entity.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 15/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class Entity: GKEntity {
    var type: EntityType {
        fatalError("Base Entity type not supported.")
    }
    
    override init() {
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
