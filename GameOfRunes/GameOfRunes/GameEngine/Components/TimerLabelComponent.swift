//
//  TimerComponent.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 16/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class TimerLabelComponent: GKComponent, Component {
    private let timerNode: SKLabelNode
    let isCountdown: Bool
    var lastUpdatedTime: TimeInterval = 0.0
    var currentTime: Int {
        didSet {
            timerNode.text = "\(currentTime)"
        }
    }
    var type: ComponentType {
        .timerComponent
    }
    
    init(timerNode: SKLabelNode, isCountdown: Bool, initialTimerValue: Int) {
        self.timerNode = timerNode
        self.isCountdown = isCountdown
        self.currentTime = initialTimerValue
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
