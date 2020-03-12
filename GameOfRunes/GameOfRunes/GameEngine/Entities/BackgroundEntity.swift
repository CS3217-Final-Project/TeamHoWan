//
//  BackgroundEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class BackgroundEntity: GKEntity {
    
    init(arenaType: ArenaType) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: arenaType.rawValue))
        addComponent(spriteComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
