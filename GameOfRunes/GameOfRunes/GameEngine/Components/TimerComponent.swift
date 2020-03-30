//
//  TimerComponent.swift
//  GameOfRunes
//
//  Created by Andy on 27/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class TimerComponent: GKComponent, Component {
    var time: TimeInterval
    let initialTimerValue: TimeInterval
    var isCountDown: Bool
    var type: ComponentType {
        .timerComponent
    }
    
    init(initialTimerValue: TimeInterval, isCountDown: Bool = true) {
        self.time = initialTimerValue
        self.initialTimerValue = initialTimerValue
        self.isCountDown = isCountDown
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
