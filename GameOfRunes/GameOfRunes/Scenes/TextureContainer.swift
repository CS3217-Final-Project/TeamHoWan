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
 loaded once, and leverage the `SKTextureAtlas` for further memory
 optimisations).
 */
class TextureContainer {
    private static var enemiesTextures = [EnemyType: [SKTexture]]()
    private static var enemyRemovalTextures = [SKTexture]()
    private static var manaTextures = [SKTexture]()

    static func loadTextures() {
        // Load `enemiesTextures`
        EnemyType.allCases.forEach { enemyType in
            let enemyAtlas = SKTextureAtlas(named: enemyType.rawValue)
            let enemyTextures = (0...6).map { enemyAtlas.textureNamed("WALK_00\($0)") }
            enemiesTextures[enemyType] = enemyTextures
        }

        // Load `manaTextures`
        let manaAtlas = SKTextureAtlas(named: "manaEssence")
        manaTextures = (0...29).map { manaAtlas.textureNamed("tile\($0)") }

        // Load `enemyRemovalTextures`
        let enemyRemovalAtlas = SKTextureAtlas(named: "removeEnemy")
        enemyRemovalTextures = (0...24).map { enemyRemovalAtlas.textureNamed("tile\($0)") }
    }

    /** Get the Animation Textures for the `enemyType` */
    static func getEnemyAnimationTextures(_ enemyType: EnemyType) -> [SKTexture] {
        Self.enemiesTextures[enemyType] ?? []
    }

    /** Get the Static Texture for the `enemyType` */
    static func getEnemyTexture(_ enemyType: EnemyType) -> SKTexture {
        Self.getEnemyAnimationTextures(enemyType).first ?? .init()
    }

    /** Get Animation Textures for Mana. */
    static func getManaAnimationTextures() -> [SKTexture] {
        manaTextures
    }

    /** Get Static Texture for Mana. */
    static func getManaTexture() -> SKTexture {
        manaTextures.first ?? .init()
    }

    /** Get Animation Textures for Enemy Removal */
    static func getEnemyRemovalAnimationTextures() -> [SKTexture] {
        enemyRemovalTextures
    }
}
