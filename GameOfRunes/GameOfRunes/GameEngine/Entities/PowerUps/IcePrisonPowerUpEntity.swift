//
//  IcePrisonPowerUpEntity.swift
//  GameOfRunes
//
//  Created by Andy on 19/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

/** Entity to represent the Hellfire Power Up */
class IcePrisonPowerUpEntity: Entity, PowerUpEntity {
    var animationNode: SKSpriteNode!
    var fading = false
    var powerUpType: PowerUpType {
        .icePrison
    }
    private weak var gameEngine: GameEngine?
    override var type: EntityType {
        .icePrisonPowerUpEntity
    }
    
    init(gameEngine: GameEngine, at position: CGPoint, with size: CGSize) {
        self.gameEngine = gameEngine
        super.init()
        
        animationNode = getCastingAnimationNode(at: position, with: size)
        let animationSpriteComponent = SpriteComponent(node: animationNode)
        animationSpriteComponent.layerType = .powerUpAnimationLayer
        addComponent(animationSpriteComponent)
        
        let timerComponent = TimerComponent(initialTimerValue: GameConfig.HellFirePowerUp.powerUpDuration)
        addComponent(timerComponent)
    }
    
    func runFadingAnimation() {
        animationNode.run(
            .fadeOut(withDuration: GameConfig.IcePrisonPowerUp.fadeOutDuration)
        )
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
