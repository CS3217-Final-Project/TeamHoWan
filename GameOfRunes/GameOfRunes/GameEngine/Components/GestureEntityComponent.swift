//
//  GestureEntityComponent.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class GestureEntityComponent: GKComponent, Component {
    let gestureEntity: GestureEntity
    var type: ComponentType {
        .gestureEntityComponent
    }
    
    init(_ entity: GestureEntity) {
        self.gestureEntity = entity
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
