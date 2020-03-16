//
//  TimerComponent.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 16/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class TimerComponent: GKComponent {
    private let timerNode: SKLabelNode
    private let isCountdown: Bool
    var lastUpdatedTime: TimeInterval = 0.0
    var currentTime: Int {
        didSet {
            timerNode.text = "\(currentTime)"
        }
    }
    
    init(timerNode: SKLabelNode, isCountdown: Bool, initialTimerValue: Int) {
        self.timerNode = timerNode
        self.isCountdown = isCountdown
        self.currentTime = initialTimerValue
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateTimeOneSecond() {
        if isCountdown {
            currentTime = max(0, currentTime - 1)
            // TODO: Check if is 0, then propagate call to game state machine for lose state.
        } else {
            currentTime = currentTime + 1
        }
    }
}
