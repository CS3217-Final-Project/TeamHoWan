//
//  CastingAnimationPowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 11/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

protocol CastingAnimationPowerUp: Animatable { }

extension CastingAnimationPowerUp {
    /**
     Returns the Animation Node with animation for "casting" phase
     */
    static func getAnimationNode(at position: CGPoint, with size: CGSize, powerUp: PowerUp.Type) -> SKSpriteNode {
        let animationNode = SKSpriteNode(texture: nil, color: .clear, size: size.applying(.init(scaleX: 1.7, y: 1.7)))
        animationNode.position = position
        
        // Create Animations (Casting of Power-Up)
        let powerUpCastTextures = TextureContainer.getPowerUpCastTextures(powerUpType: powerUp.type)
        let powerUpCastAnimation: SKAction = .animate(
            with: powerUpCastTextures,
            timePerFrame: 0.05,
            resize: false,
            restore: false
        )
        
        let animationAction = SKAction.sequence([powerUpCastAnimation, .fadeOut(withDuration: 0.25)])
        let soundAction = SKAction.playSoundFileNamed("cast power up", waitForCompletion: false)
        animationNode.run(SKAction.group([animationAction, soundAction]))
        
        return animationNode
    }
}
