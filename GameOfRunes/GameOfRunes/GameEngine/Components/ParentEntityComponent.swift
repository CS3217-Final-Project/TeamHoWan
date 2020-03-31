//
//  ParentEntityComponent.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class ParentEntityComponent: GKComponent, Component {
    private(set) weak var parent: Entity?
    var type: ComponentType {
        .parentEntityComponent
    }
    
    init(_ parent: Entity) {
        self.parent = parent
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
