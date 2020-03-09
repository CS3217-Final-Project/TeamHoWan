//
//  EndPointEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class EndPointEntity: GKEntity {
    
    override init() {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: .init(imageNamed: "finish-line2"))
        
        let teamComponent = TeamComponent(teamType: .player)
        
        addComponent(spriteComponent)
        addComponent(teamComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
