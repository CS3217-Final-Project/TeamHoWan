//
//  AnimationPowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

protocol Animatable {
    func getAnimationNode(at position: CGPoint, with size: CGSize, powerUp: PowerUp) -> SKSpriteNode
}

protocol CastingAnimationPowerUp: Animatable { }

extension CastingAnimationPowerUp {
    /**
     Returns the Animation Node with animation for "casting" phase
     */
    func getAnimationNode(at position: CGPoint, with size: CGSize, powerUp: PowerUp) -> SKSpriteNode {
        let animationNode = SKSpriteNode(texture: nil, color: .clear, size: size.applying(.init(scaleX: 1.7, y: 1.7)))
        animationNode.position = position
        
        // Create Animations (Casting of Power-Up)
        guard let powerUpType = PowerUpType.getPowerUpType(powerUp: powerUp) else {
            return SKSpriteNode()
        }
        let powerUpCastTextures = TextureContainer.getPowerUpCastTextures(powerUpType: powerUpType)
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

protocol AllAnimationPowerUp: Animatable { }

extension AllAnimationPowerUp {
    /**
     Returns the Animation Node with animation for "casting" phase and "in-effect" phase.
     */
    func getAnimationNode(at position: CGPoint, with size: CGSize, powerUp: PowerUp) -> SKSpriteNode {
        // scale up the animation
        let animationNode = SKSpriteNode(texture: nil, color: .clear, size: size.applying(.init(scaleX: 1.7, y: 1.7)))
        animationNode.position = position
        
        // Create Animations (Casting of Power-Up)
        guard let powerUpType = PowerUpType.getPowerUpType(powerUp: powerUp) else {
            return SKSpriteNode()
        }
        let powerUpCastTextures = TextureContainer.getPowerUpCastTextures(powerUpType: powerUpType)
        let powerUpCastAnimation: SKAction = .animate(
            with: powerUpCastTextures,
            timePerFrame: 0.05,
            resize: false,
            restore: false
        )
        
        // Create Animation (When Power-Up is In Effect)
        let powerUpTextures = TextureContainer.getPowerUpTextures(powerUpType: powerUpType)
        let powerUpAnimation = SKAction.repeatForever(
            .animate(
                with: powerUpTextures,
                timePerFrame: 0.05,
                resize: false,
                restore: false
            )
        )
        
        let animationAction = SKAction.sequence([powerUpCastAnimation, powerUpAnimation])
        let soundAction = SKAction.playSoundFileNamed("cast power up", waitForCompletion: false)
        animationNode.run(SKAction.group([animationAction, soundAction]))
        
        return animationNode
    }
}
