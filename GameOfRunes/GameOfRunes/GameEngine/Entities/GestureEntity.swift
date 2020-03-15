//
//  GestureEntity.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class GestureEntity: Entity {
    unowned let parentEntity: GKEntity

    init(gesture: CustomGesture, parent: GKEntity) {
        self.parentEntity = parent

        super.init()
        
        let spriteComponent = SpriteComponent(gesture: gesture)
        let gestureComponent = GestureComponent(gesture: gesture)

        addComponent(spriteComponent)
        addComponent(gestureComponent)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func getType() -> EntityType {
        return .gestureEntity
    }
}
