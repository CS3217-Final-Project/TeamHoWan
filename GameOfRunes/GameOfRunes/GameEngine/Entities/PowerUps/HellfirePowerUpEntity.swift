//
//  HellfireEntity.swift
//  GameOfRunes
//
//  Created by Andy on 19/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

/** Entity to represent the Hellfire Power Up */
class HellfirePowerUpEntity: Entity, PowerUpEntity {
    var fading = false
    var powerUpType: PowerUpType {
        .hellfire
    }
    private weak var gameEngine: GameEngine?
    override var type: EntityType {
        .hellFirePowerUpEntity
    }
    
    init(gameEngine: GameEngine, at position: CGPoint, with size: CGSize) {
        self.gameEngine = gameEngine
        super.init()

        let animationNode = getAnimationNode(at: position, with: size)
<<<<<<< HEAD
        let animationSpriteComponent = SpriteComponent(node: animationNode, layerType: .powerUpAnimationLayer)
=======
        let animationSpriteComponent = SpriteComponent(node: animationNode)
        animationSpriteComponent.layerType = .powerUpAnimationLayer
        
        animationNode.component = animationSpriteComponent
        animationNode.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 4)
        animationNode.physicsBody?.affectedByGravity = false
        animationNode.physicsBody?.categoryBitMask = CollisionType.powerUp.rawValue
        animationNode.physicsBody?.contactTestBitMask = CollisionType.enemy.rawValue
        animationNode.physicsBody?.collisionBitMask = 0

>>>>>>> 2a1f7ce768ddaffdbd09b7b83f8eeaab239d7490
        addComponent(animationSpriteComponent)
        
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.HellFirePowerUp.powerUpDuration)
        addComponent(timerComponent)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
