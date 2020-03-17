//
//  PowerUpType.swift
//  GameOfRunes
//
//  Created by Jermy on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum PowerUpType: String, CaseIterable {
    case hellfire
    case icePrison
    case darkVortex
    
    private static var powerUpCastsTextures = [PowerUpType: [SKTexture]]()
    private static var powerUpsTextures = [PowerUpType: [SKTexture]]()
    
    var manaUnitCost: Int {
        switch self {
        case .hellfire:
            return 6
        case .icePrison:
            return 8
        case .darkVortex:
            return 4
        }
    }
    
    // have to preload at the start of the gameplay scene to prevent delay in rendering
    static func loadPowerUpCastsTextures() {
        guard powerUpCastsTextures.isEmpty else {
            return
        }
        allCases.forEach { powerUpType in
            let powerUpCastAtlas = SKTextureAtlas(named: "\(powerUpType)Cast")
            let powerUpCastTextures = (0...19).map {
                powerUpCastAtlas.textureNamed(.init(format: "tile%03d", $0))
            }
            powerUpCastsTextures[powerUpType] = powerUpCastTextures
        }
        
        loadPowerUpTextures()
    }
    
    private static func loadPowerUpTextures() {
        guard powerUpsTextures.isEmpty else {
            return
        }
        let hellfireAtlas = SKTextureAtlas(named: hellfire.rawValue)
        powerUpsTextures[hellfire] = (690000...690019).map { hellfireAtlas.textureNamed("\($0)") }
        
        let darkVortexAtlas = SKTextureAtlas(named: darkVortex.rawValue)
        powerUpsTextures[darkVortex] = (670000...670019).map { darkVortexAtlas.textureNamed("\($0)") }
    }
    
    func runAnimation(at position: CGPoint, with size: CGSize, on node: SKNode) {
        let animationNode = SKSpriteNode(texture: nil, color: .clear, size: size)
        animationNode.position = position
        var powerUpCastAnimation: SKAction?
        var powerUpAnimation: SKAction?
        
        if let powerUpCastTextures = Self.powerUpCastsTextures[self] {
            powerUpCastAnimation = .animate(with: powerUpCastTextures, timePerFrame: 0.1, resize: false, restore: false)
        }
        
        if let powerUpTextures = Self.powerUpsTextures[self] {
            powerUpAnimation = SKAction.sequence([
                .repeat(
                .animate(with: powerUpTextures, timePerFrame: 0.05, resize: false, restore: false),
                count: 10
                ),
                .fadeOut(withDuration: 0.5)
            ])
        }
        
        let animationAction = SKAction.sequence([
            powerUpCastAnimation ?? SKAction(),
            powerUpAnimation ?? SKAction(),
            .removeFromParent()
        ])
        
        let soundAction = SKAction.playSoundFileNamed("cast power up", waitForCompletion: false)
        
        animationNode.run(SKAction.group([animationAction, soundAction]))
        node.addChild(animationNode)
    }
}
