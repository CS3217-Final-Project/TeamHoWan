//
//  PlayerManaEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class PlayerManaEntity: GKEntity {
    
    override init() {
        super.init()
        
        //let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        //addComponent(spriteComponent)
        
        let manaComponent = ManaComponent(manaPoints: 0)
        addComponent(manaComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
