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
    
    init(gameEngine: GameEngine, timerNode: SKLabelNode, isCountdown: Bool, initialTimerValue: Int) {
        super.init()
        
        let timerComponent = TimerLabelComponent(timerNode: timerNode, isCountdown: isCountdown,
                                                 initialTimerValue: initialTimerValue)
        addComponent(timerComponent)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
