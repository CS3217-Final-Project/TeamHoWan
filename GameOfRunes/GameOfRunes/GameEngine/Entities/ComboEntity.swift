//
//  ComboEntity.swift
//  GameOfRunes
//
//  Created by Andy on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class ComboEntity: Entity {
    override var type: EntityType {
        .comboEntity
    }

    init(gameEngine: GameEngine) {
        super.init()
        
        // SCORENODE FRONTEND TAG FOR JEREMY
        let labelNode = SKLabelNode(text: "0")
        let labelComponent = LabelComponent(labelNode: labelNode)
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.Score.comboTimer)
        gameEngine.gameScene?.addNodeToLayer(layer: .highestPriorityLayer, node: labelNode)
        addComponent(labelComponent)
        addComponent(timerComponent)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
