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
    
    init(imageName: String) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        addComponent(spriteComponent)
    }
    
    init(texture: SKTexture) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: texture)
        addComponent(spriteComponent)
    }
    
    override convenience init() {
        let evilKnightAtlas = SKTextureAtlas(named: "Evil Knight")
        self.init(texture: evilKnightAtlas.textureNamed("WALK_002"))
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
