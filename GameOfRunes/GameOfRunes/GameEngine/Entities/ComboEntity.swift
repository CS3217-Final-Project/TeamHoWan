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
        
        guard let renderNodeSize = gameEngine.renderNode?.size else {
            return
        }
        
        // FRONTEND TAG 
        let labelNode = SKLabelNode(fontNamed: "DragonFire")
        let labelComponent = LabelComponent(node: labelNode)
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.Score.comboTimer)
        let multiplierComponent = MultiplierComponent(gameEngine: gameEngine)

        labelNode.text = "0"
        labelNode.position = .init(x: 5 * renderNodeSize.width / 6, y: renderNodeSize.height / 2)
        labelNode.fontSize = 75
        labelNode.fontColor = SKColor.red
        labelNode.horizontalAlignmentMode = .center
        labelNode.verticalAlignmentMode = .center

        addComponent(multiplierComponent)
        addComponent(labelComponent)
        addComponent(timerComponent)
    }
}
