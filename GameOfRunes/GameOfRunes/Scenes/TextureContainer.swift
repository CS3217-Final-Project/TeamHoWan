//
//  TextureContainer.swift
//  GameOfRunes
//
//  Created by Brian Yen on 15/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class TextureContainer {
    private static var enemiesTextures = [EnemyType: [SKTexture]]()
    private static var manaTextures = [SKTexture]()

    static func loadTextures() {
        // Load `enemiesTextures`
        EnemyType.allCases.forEach { enemyType in
            print("in heres")
            let enemyAtlas = SKTextureAtlas(named: enemyType.rawValue)
            let enemyTextures = (0...6).map { enemyAtlas.textureNamed("WALK_00\($0)") }
            enemiesTextures[enemyType] = enemyTextures
        }

        // Load `manaTextures`
        let manaAtlas = SKTextureAtlas(named: "manaEssence")
        manaTextures = (0...29).map { manaAtlas.textureNamed("tile\($0)") }
    }

    static func getEnemyAnimationTextures(_ enemyType: EnemyType) -> [SKTexture] {
        Self.enemiesTextures[enemyType] ?? []
    }

    static func getEnemyTexture(_ enemyType: EnemyType) -> SKTexture {
        Self.getEnemyAnimationTextures(enemyType).first ?? .init()
    }

    static func getManaAnimationTextures() -> [SKTexture] {
        manaTextures
    }

    static func getManaTexture() -> SKTexture {
        manaTextures.first ?? .init()
    }
}
