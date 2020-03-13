//
//  EnemyType.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

enum EnemyType: String, CaseIterable {
    case evilKnight
    case orc1
    case orc2
    case orc3
    case troll1
    case troll2
    case troll3
    
    private static var enemiesTextures = [EnemyType: [SKTexture]]()
    
    // have to preload at the start of the gameplay scene to prevent delay in rendering
    static func loadEnemiesTextures() {
        guard enemiesTextures.isEmpty else {
            return
        }
        EnemyType.allCases.forEach { enemyType in
            let enemyAtlas = SKTextureAtlas(named: enemyType.rawValue)
            let enemyTextures = (0...6).map { enemyAtlas.textureNamed("WALK_00\($0)") }
            enemiesTextures[enemyType] = enemyTextures
        }
    }
    
    var staticTexture: SKTexture {
        animationTextures.first ?? .init()
    }
    
    var animationTextures: [SKTexture] {
        Self.enemiesTextures[self] ?? []
    }
    
    var health: Int {
        switch self {
        default:
            return 1
        }
    }
    
    var gesturesAvailable: [CustomGesture] {
        switch self {
        default:
            return [.arrowUp]
        }
    }
}
