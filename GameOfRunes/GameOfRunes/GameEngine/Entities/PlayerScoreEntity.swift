//
//  PlayerScoreEntity.swift
//  GameOfRunes
//
//  Created by Andy on 25/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class PlayerScoreEntity: Entity {
    override var type: EntityType {
        .playerScoreEntity
    }
    
    override init() {
        super.init()

        let scoreComponent = ScoreComponent(scorePoints: 0)
        addComponent(scoreComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
