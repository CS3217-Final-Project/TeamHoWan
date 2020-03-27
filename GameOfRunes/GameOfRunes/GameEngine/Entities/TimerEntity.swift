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
    
    init(gameEngine: GameEngine, isCountdown: Bool, initialTimerValue: Int) {
        super.init()
        
        guard let gameScene = gameEngine.gameScene else {
            return
        }
        
        let timerLabel = SKLabelNode(fontNamed: "DragonFire")
        
        timerLabel.fontSize = 50
        timerLabel.fontColor = SKColor.white
        timerLabel.position = CGPoint(x: gameScene.size.width / 2, y: 50)
        timerLabel.zPosition = 75
        timerLabel.horizontalAlignmentMode = .center
        timerLabel.verticalAlignmentMode = .center
        timerLabel.text = "\(initialTimerValue)"
        
        gameScene.playerAreaLayer.addChild(timerLabel)
        
        let timerComponent = TimerLabelComponent(timerNode: timerLabel,
                                            isCountdown: isCountdown,
                                            initialTimerValue: initialTimerValue)
        addComponent(timerComponent)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
