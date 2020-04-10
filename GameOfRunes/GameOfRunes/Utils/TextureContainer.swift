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
    private static var enemiesTextures: [EnemyType: [SKTexture]] = loadEnemiesTextures()
    private(set) static var fullEnemyRemovalTextures: [SKTexture] = loadFullEnemyRemovalTextures()
    private(set) static var halfEnemyRemovalTextures: [SKTexture]  = { Array(Self.fullEnemyRemovalTextures[0...7]) }()
    private static var manaTextures: [ManaType: [SKTexture]] = loadManaTextures()
    private(set) static var manaRemovalTextures: [SKTexture] = {
        let numTextures = Self.fullEnemyRemovalTextures.count
        return Array(Self.fullEnemyRemovalTextures[7..<numTextures])
    }()
    private static var powerUpCastTextures: [PowerUp: [SKTexture]] = loadPowerUpCastTextures()
    private static var powerUpTextures: [PowerUp: [SKTexture]] = loadPowerUpTextures()
    private static var avatarsTextures: [Avatar: [SKTexture]] = loadAvatarsTextures()
    private(set) static var eliteKnightTextures: [SKTexture] = loadEliteKnightTextures()
    
    private static func loadEnemiesTextures() -> [EnemyType: [SKTexture]] {
        var enemiesTextures = [EnemyType: [SKTexture]]()
        
        EnemyType.allCases.forEach { enemyType in
            let enemyAtlas = SKTextureAtlas(named: "\(enemyType)")
            let enemyTextures = (0...6).map { enemyAtlas.textureNamed("WALK_00\($0)") }
            enemiesTextures[enemyType] = enemyTextures
        }
        
        return enemiesTextures
    }
    
    private static func loadManaTextures() -> [ManaType: [SKTexture]] {
        var manaTextures = [ManaType: [SKTexture]]()
        
        ManaType.allCases.forEach { manaType in
            let manaAtlas = SKTextureAtlas(named: "\(manaType)Mana")
            let textures = (0...29).map { manaAtlas.textureNamed(.init(format: "tile%03d", $0)) }
            manaTextures[manaType] = textures
        }
        
        return manaTextures
    }
    
    private static func loadFullEnemyRemovalTextures() -> [SKTexture] {
        let enemyRemovalAtlas = SKTextureAtlas(named: "removeEnemyFull")
        let fullEnemyRemovalTextures = (0...24).map { enemyRemovalAtlas.textureNamed(.init(format: "tile%03d", $0)) }
        
        return fullEnemyRemovalTextures
    }
    
    private static func loadPowerUpCastTextures() -> [PowerUp: [SKTexture]] {
        var powerUpCastTextures = [PowerUp: [SKTexture]]()
        
        PowerUpType.allCases.forEach { powerUpType in
            let powerUpCastAtlas = SKTextureAtlas(named: "\(powerUpType)Cast")
            let numTextures = powerUpCastAtlas.textureNames.count
            let castTextures = (0..<numTextures).map { powerUpCastAtlas.textureNamed(.init(format: "tile%03d", $0)) }
            powerUpCastTextures[powerUpType] = castTextures
        }
        
        return powerUpCastTextures
    }
    
    private static func loadPowerUpTextures() -> [PowerUp: [SKTexture]] {
        var powerUpTextures = [PowerUp: [SKTexture]]()
        
        let hellfireAtlas = SKTextureAtlas(named: "\(PowerUpType.hellfire)")
        powerUpTextures[PowerUpType.hellfire] = (690_000...690_019).map { hellfireAtlas.textureNamed("\($0)") }
        let darkVortexAtlas = SKTextureAtlas(named: "\(PowerUpType.darkVortex)")
        powerUpTextures[PowerUpType.darkVortex] = (670_000...670_019).map { darkVortexAtlas.textureNamed("\($0)") }
        
        return powerUpTextures
    }
    
    private static func loadAvatarsTextures() -> [Avatar: [SKTexture]] {
        var avatarsTextures = [Avatar: [SKTexture]]()
        
        Avatar.allCases.forEach { avatar in
            let avatarAtlas = SKTextureAtlas(named: "\(avatar)")
            let avatarTextures = (0...9).map { avatarAtlas.textureNamed("IDLE_00\($0)") }
            avatarsTextures[avatar] = avatarTextures
        }
        
        return avatarsTextures
    }
    
    private static func loadEliteKnightTextures() -> [SKTexture] {
        let eliteKnightAtlas = SKTextureAtlas(named: "eliteKnight")
        let eliteKnightTextures = (0...6).map { eliteKnightAtlas.textureNamed("WALK_00\($0)") }
        return eliteKnightTextures
    }

    static func loadTextures() {
        // force load `enemiesTextures`
        _ = enemiesTextures

        // force load `manaTextures`
        _ = manaTextures

        // force load `fullEnemyRemovalTextures`
        _ = fullEnemyRemovalTextures
        
        // force load `halfEnemyRemovalTextures`
        _ = halfEnemyRemovalTextures
        
        // force load `manaRemovalTextures`
        _ = manaRemovalTextures
        
        // force load `powerUpCastTextures`
        _ = powerUpCastTextures

        // force load `powerUpTextures`
        _ = powerUpTextures
        
        // force load `avatarsTextures`
        _ = avatarsTextures
        
        // force load `eliteKnightTextures`
        _ = eliteKnightTextures
    }

    /** Get the Animation Textures for the `enemyType` */
    static func getEnemyAnimationTextures(_ enemyType: EnemyType) -> [SKTexture] {
        enemiesTextures[enemyType] ?? []
    }

    /** Get the Static Texture for the `enemyType` */
    static func getEnemyTexture(_ enemyType: EnemyType) -> SKTexture {
        getEnemyAnimationTextures(enemyType).first ?? .init()
    }
    
    static func getManaTextures(manaType: ManaType) -> [SKTexture] {
        manaTextures[manaType] ?? []
    }

    /** Get the Animation Textures for Power Up Casting */
    static func getPowerUpCastTextures(powerUpType: PowerUp) -> [SKTexture] {
        powerUpCastTextures[powerUpType] ?? []
    }

    /** Get the Animation Textures for Power Up (when in effect) */
    static func getPowerUpTextures(powerUpType: PowerUp) -> [SKTexture] {
        powerUpTextures[powerUpType] ?? []
    }
    
    /** Get the Animation Textures for the `Avatar` */
    static func getAvatarTextures(avatar: Avatar) -> [SKTexture] {
        avatarsTextures[avatar] ?? []
    }
}
