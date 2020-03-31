//
//  PowerUpEntity.swift
//  GameOfRunes
//
//  Created by Brian Yen on 19/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit


class PowerUpEntity: Entity {
    static func getCastingAnimationNode(
        for powerUpType: PowerUpType,
        at position: CGPoint,
        with size: CGSize
    ) -> SKSpriteNode {
                                                                            // scale up the animation
        let animationNode = SKSpriteNode(texture: nil, color: .clear, size: size.applying(.init(scaleX: 1.7, y: 1.7)))
        animationNode.position = position

        // Create Animations (Casting of Power-Up)
        let powerUpCastTextures = TextureContainer.getPowerUpCastTextures(powerUpType: powerUpType)
        let powerUpCastAnimation: SKAction = .animate(
            with: powerUpCastTextures,
            timePerFrame: 0.05,
            resize: false,
            restore: false
        )

        let animationAction = SKAction.sequence([powerUpCastAnimation])
        let soundAction = SKAction.playSoundFileNamed("cast power up", waitForCompletion: false)
        animationNode.run(SKAction.group([animationAction, soundAction]))

        return animationNode
    }
    
    /**
     Returns the Animation Node with animation
     for "casting" phase and "in-effect" phase.
     */
    static func getAnimationNode(
        for powerUpType: PowerUpType,
        at position: CGPoint,
        with size: CGSize
    ) -> SKSpriteNode {
                                                                            // scale up the animation
        let animationNode = SKSpriteNode(texture: nil, color: .clear, size: size.applying(.init(scaleX: 1.7, y: 1.7)))
        animationNode.position = position

        // Create Animations (Casting of Power-Up)
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
