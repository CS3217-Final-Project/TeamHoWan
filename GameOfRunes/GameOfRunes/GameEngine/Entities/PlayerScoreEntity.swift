//
//  PlayerScoreEntity.swift
//  GameOfRunes
//
//  Created by Andy on 25/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class PlayerScoreEntity: Entity {
    override var type: EntityType {
        .playerScoreEntity
    }
    
    init(gameEngine: GameEngine) {
        super.init()

        guard let gameScene = gameEngine.gameScene else {
            return
        }
        
        let scoreLabelNode = SKLabelNode(fontNamed: "DragonFire")
        
        scoreLabelNode.fontSize = 50
        scoreLabelNode.fontColor = SKColor.white
        scoreLabelNode.position = CGPoint(x: 2 * gameScene.size.width / 3, y: 50)
        scoreLabelNode.zPosition = 75
        scoreLabelNode.horizontalAlignmentMode = .center
        scoreLabelNode.verticalAlignmentMode = .center
        scoreLabelNode.text = "0"
        gameScene.playerAreaLayer.addChild(scoreLabelNode)

        let playerScoreComponent = PlayerScoreComponent(scoreNode: scoreLabelNode)
        let multiplierComponent = MultiplerComponent()
                
        addComponent(scoreComponent)
        addComponent(multiplierComponent)
        addComponent(playerScoreComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
