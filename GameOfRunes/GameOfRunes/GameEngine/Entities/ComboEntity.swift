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
        
        let labelNode = SKLabelNode(fontNamed: "DragonFire")
        let labelComponent = LabelComponent(node: labelNode)
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.Score.comboTimer)
        let multiplierComponent = MultiplierComponent(gameEngine: gameEngine)

        labelNode.text = "0"
        labelNode.position = .init(x: 5 * gameEngine.sceneWidth / 6, y: gameEngine.sceneHeight / 2)
        labelNode.fontSize = 75
        labelNode.fontColor = SKColor.red
        labelNode.horizontalAlignmentMode = .center
        labelNode.verticalAlignmentMode = .center

        addComponent(multiplierComponent)
        addComponent(labelComponent)
        addComponent(timerComponent)
    }
}
