//
//  PowerUpType.swift
//  GameOfRunes
//
//  Created by Jermy on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum PowerUpType: String, CaseIterable {
    case darkVortex
    case hellfire
    case icePrison
    case divineBlessing
    case divineShield
    case heroicCall
    
    var description: String {
        switch self {
        case .darkVortex:
            return GameConfig.DarkVortexPowerUp.description
        case .hellfire:
            return GameConfig.HellFirePowerUp.description
        case .icePrison:
            return GameConfig.IcePrisonPowerUp.description
        case .divineBlessing:
            return GameConfig.DivineBlessingPowerUp.description
        case .divineShield:
            return GameConfig.DivineShieldPowerUp.description
        case .heroicCall:
            return GameConfig.HeroicCallPowerUp.description
        }
    }
    
    var manaUnitCost: Int {
        switch self {
        case .darkVortex:
            return GameConfig.DarkVortexPowerUp.manaUnitCost
        case .hellfire:
            return GameConfig.HellFirePowerUp.manaUnitCost
        case .icePrison:
            return GameConfig.IcePrisonPowerUp.manaUnitCost
        case .divineBlessing:
            return GameConfig.DivineBlessingPowerUp.manaUnitCost
        case .divineShield:
            return GameConfig.DivineShieldPowerUp.manaUnitCost
        case .heroicCall:
            return GameConfig.HeroicCallPowerUp.manaUnitCost
        }
    }
    
    var getFadeOutDuration: TimeInterval {
        switch self {
        case .hellfire:
            return GameConfig.HellFirePowerUp.fadeOutDuration
        case .icePrison:
            return GameConfig.IcePrisonPowerUp.fadeOutDuration
        case .darkVortex:
            return GameConfig.DarkVortexPowerUp.fadeOutDuration
        default:
            return 0
        }
    }
    
    var getPowerUpDuration: TimeInterval {
        switch self {
        case .hellfire:
            return GameConfig.HellFirePowerUp.powerUpDuration
        case .icePrison:
            return GameConfig.IcePrisonPowerUp.powerUpDuration
        case .darkVortex:
            return GameConfig.DarkVortexPowerUp.powerUpDuration
        default:
            return 0
        }
    }
    
    func createEntity(at position: CGPoint, with size: CGSize) -> Entity {
        switch self {
        case .hellfire:
            return HellfirePowerUpEntity(at: position, with: size)
        case .icePrison:
            return IcePrisonPowerUpEntity(at: position, with: size)
        case .darkVortex:
            return DarkVortexPowerUpEntity(at: position, with: size)
        default:
            return .init()
        }
    }
    
    func getCastingAnimationNode(
        at position: CGPoint,
        with size: CGSize
    ) -> SKSpriteNode {
                                                                            // scale up the animation
        let animationNode = SKSpriteNode(texture: nil, color: .clear, size: size.applying(.init(scaleX: 1.7, y: 1.7)))
        animationNode.position = position

        // Create Animations (Casting of Power-Up)
        let powerUpCastTextures = TextureContainer.getPowerUpCastTextures(powerUpType: self)
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
    func getAnimationNode(
        at position: CGPoint,
        with size: CGSize
    ) -> SKSpriteNode {
                                                                            // scale up the animation
        let animationNode = SKSpriteNode(texture: nil, color: .clear, size: size.applying(.init(scaleX: 1.7, y: 1.7)))
        animationNode.position = position

        // Create Animations (Casting of Power-Up)
        let powerUpCastTextures = TextureContainer.getPowerUpCastTextures(powerUpType: self)
        let powerUpCastAnimation: SKAction = .animate(
            with: powerUpCastTextures,
            timePerFrame: 0.05,
            resize: false,
            restore: false
        )

        // Create Animation (When Power-Up is In Effect)
        let powerUpTextures = TextureContainer.getPowerUpTextures(powerUpType: self)
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
