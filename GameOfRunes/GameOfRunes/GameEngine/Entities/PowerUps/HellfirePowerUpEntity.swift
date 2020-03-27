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
    var animationNode: SKSpriteNode!
    var fading = false
    var powerUpType: PowerUpType {
        .hellfire
    }
    private weak var gameEngine: GameEngine?
    override var type: EntityType {
        .hellFirePowerUpEntity
    }
    
    init(gameEngine: GameEngine, at position: CGPoint, with size: CGSize) {
        super.init()
        self.gameEngine = gameEngine
        self.animationNode = getAnimationNode(at: position, with: size)
        let animationSpriteComponent = SpriteComponent(node: animationNode)
        animationSpriteComponent.layerType = .powerUpAnimationLayer
        addComponent(animationSpriteComponent)
        
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.HellFirePowerUp.powerUpDuration)
        addComponent(timerComponent)
    }
    
    func runFadingAnimation() {
        animationNode.run(
            .fadeOut(withDuration: GameConfig.HellFirePowerUp.fadeOutDuration)
        )
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
