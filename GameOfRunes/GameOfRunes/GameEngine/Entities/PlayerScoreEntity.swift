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
        
        let scoreNode = ScoreNode()
        scoreNode.position = CGPoint(x: 5 * gameScene.size.width / 6, y: 9 * gameScene.playerAreaNode.size.height / 22)

        gameScene.playerAreaLayer.addChild(scoreNode)
        
        let scoreComponent = ScoreComponent(scorePoints: 0, scoreNode: scoreNode)
        let multiplierComponent = MultiplierComponent()
        
        addComponent(scoreComponent)
        addComponent(multiplierComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
