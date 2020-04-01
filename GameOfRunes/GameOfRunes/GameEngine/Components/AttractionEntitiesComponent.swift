//
//  AttractionEntitiesComponent.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class AttractionEntitiesComponent: GKComponent, Component {
    var attractionEntities: [AttractionEntity]
    var type: ComponentType {
        .attractionEntitiesComponent
    }
    
    convenience init(_ entities: AttractionEntity...) {
        self.init(entities)
    }
    
    init(_ entities: [AttractionEntity]) {
        attractionEntities = entities
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
