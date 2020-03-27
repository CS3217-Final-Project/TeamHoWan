//
//  TimerComponent.swift
//  GameOfRunes
//
//  Created by Andy on 27/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class TimerComponent: GKComponent, Component {
    var timeLeft: TimeInterval
    var type: ComponentType {
        .timerComponent
    }
    
    init(initialTimerValue: TimeInterval) {
        self.timeLeft = initialTimerValue
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
