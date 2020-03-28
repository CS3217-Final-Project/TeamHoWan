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
        
        guard let gameScene = gameEngine.gameScene else {
            return
        }
        
        // SCORENODE FRONTEND TAG FOR JEREMY
        let labelNode = SKLabelNode(fontNamed: "DragonFire")
        let labelComponent = LabelComponent(node: labelNode)
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.Score.comboTimer)
        
        labelNode.text = "0"
        labelNode.position = .init(x: 5 * gameScene.size.width / 6, y: gameScene.size.height / 2)
        labelNode.fontSize = 75
        labelNode.fontColor = SKColor.red
        labelNode.horizontalAlignmentMode = .center
        labelNode.verticalAlignmentMode = .center

        addComponent(labelComponent)
        addComponent(timerComponent)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
