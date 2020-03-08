//
//  GameScene.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    private var entityManager: EntityManager!
    
    override func sceneDidLoad() {
        entityManager = .init(scene: self)
        
        setUpBackground()
        setUpEnemy()
    }
    
    private func setUpBackground() {
        let backgroundEntity = BackgroundEntity(imageName: "arena 2")
        
        if let spriteComponent = backgroundEntity.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = .init(
                x: size.width / 2,
                y: size.height / 2
            )
            spriteComponent.node.size = size
            spriteComponent.node.zPosition = -1
        }
        
        entityManager.add(backgroundEntity)
    }
    
    private func setUpEnemy() {
        let evilKnightAtlas = SKTextureAtlas(named: "Evil Knight")
        let enemyEntity = EnemyEntity(texture: evilKnightAtlas.textureNamed("WALK_002"))
        
        if let spriteComponent = enemyEntity.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = .init(
                x: size.width / 2,
                y: size.height / 2
            )
            let currentSpriteSize = spriteComponent.node.size
            let newSpriteWidth = size.width / 8
            let newSpriteHeight = currentSpriteSize.height / currentSpriteSize.width * newSpriteWidth
            spriteComponent.node.size = .init(width: newSpriteWidth, height: newSpriteHeight)
        }
        
        entityManager.add(enemyEntity)
    }
}
