//
//  TextureContainer.swift
//  GameOfRunes
//
//  Created by Brian Yen on 15/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/**
 Container for all the different `SKTexture`s used in the Game.
 This is to facilitate more efficient memory usage (the textures are only
 loaded once with a single call to `loadTextures` when the game is
 first loaded, and leverage the `SKTextureAtlas` for further memory
 optimisations).
 */
enum TextureContainer {
    private static var enemiesTextures = [EnemyType: [SKTexture]]()
    private(set) static var fullEnemyRemovalTextures = [SKTexture]()
    private(set) static var halfEnemyRemovalTextures = { Array(Self.fullEnemyRemovalTextures[0...7]) }()
    private(set) static var manaTextures = [SKTexture]()
    private(set) static var manaRemovalTextures: [SKTexture] = {
        let numTextures = Self.fullEnemyRemovalTextures.count
        return Array(Self.fullEnemyRemovalTextures[5..<numTextures])
    }()
    private static var powerUpCastTextures = [PowerUpType: [SKTexture]]()
    private static var powerUpTextures = [PowerUpType: [SKTexture]]()

    static func loadTextures() {
        // Load `enemiesTextures`
        EnemyType.allCases.forEach { enemyType in
            let enemyAtlas = SKTextureAtlas(named: enemyType.rawValue)
            let enemyTextures = (0...6).map { enemyAtlas.textureNamed("WALK_00\($0)") }
            enemiesTextures[enemyType] = enemyTextures
        }

        // Load `manaTextures`
        let manaAtlas = SKTextureAtlas(named: "manaEssence")
        manaTextures = (0...29).map { manaAtlas.textureNamed(.init(format: "tile%03d", $0)) }

        // Load `enemyRemovalTextures`
        let enemyRemovalAtlas = SKTextureAtlas(named: "removeEnemyFull")
        fullEnemyRemovalTextures = (0...24).map { enemyRemovalAtlas.textureNamed(.init(format: "tile%03d", $0)) }

        // Load `powerUpCastTextures`
        PowerUpType.allCases.forEach { powerUpType in
            let powerUpCastAtlas = SKTextureAtlas(named: "\(powerUpType)Cast")
            let castTextures = (0...19).map { powerUpCastAtlas.textureNamed(.init(format: "tile%03d", $0)) }
            powerUpCastTextures[powerUpType] = castTextures
        }

        // Load `powerUpTextures`
        let hellfireAtlas = SKTextureAtlas(named: PowerUpType.hellfire.rawValue)
        powerUpTextures[PowerUpType.hellfire] = (690_000...690_019).map {
            hellfireAtlas.textureNamed("\($0)")
        }
        let darkVortexAtlas = SKTextureAtlas(named: PowerUpType.darkVortex.rawValue)
        powerUpTextures[PowerUpType.darkVortex] = (670_000...670_019).map { darkVortexAtlas.textureNamed("\($0)")
        }
    }

    /** Get the Animation Textures for the `enemyType` */
    static func getEnemyAnimationTextures(_ enemyType: EnemyType) -> [SKTexture] {
        Self.enemiesTextures[enemyType] ?? []
    }

    /** Get the Static Texture for the `enemyType` */
    static func getEnemyTexture(_ enemyType: EnemyType) -> SKTexture {
        Self.getEnemyAnimationTextures(enemyType).first ?? .init()
    }

    /** Get the Animation Textures for Power Up Casting */
    static func getPowerUpCastTextures(powerUpType: PowerUpType) -> [SKTexture] {
        powerUpCastTextures[powerUpType] ?? []
    }

    /** Get the Animation Textures for Power Up (when in effect) */
    static func getPowerUpTextures(powerUpType: PowerUpType) -> [SKTexture] {
        powerUpTextures[powerUpType] ?? []
    }
}
