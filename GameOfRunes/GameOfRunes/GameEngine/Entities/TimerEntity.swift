//
//  TimerEntity.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 16/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class TimerEntity: Entity {
    override var type: EntityType {
        .timerEntity
    }
    
    init(gameEngine: GameEngine, timerNode: SKLabelNode, initialTimerValue: TimeInterval) {
        super.init()
        
        let labelComponent = LabelComponent(labelNode: timerNode)
        let timerComponent = TimerComponent(initialTimerValue: initialTimerValue, isCountDown: false)
        addComponent(timerComponent)
        addComponent(labelComponent)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
