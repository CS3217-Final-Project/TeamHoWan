//
//  EnemyEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class EnemyEntity: GKEntity {
    
    init(enemyType: EnemyType) {
        super.init()
        
        let enemyAtlas = SKTextureAtlas(named: enemyType.rawValue)
        let spriteComponent = SpriteComponent(texture: enemyAtlas.textureNamed("WALK_002"))
        addComponent(spriteComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
