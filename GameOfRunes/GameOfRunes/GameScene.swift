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
    private var lastUpdateTime: TimeInterval = 0.0
    let manaLabel = SKLabelNode(fontNamed: "HVDComicSerifPro")
    
    override func sceneDidLoad() {
        entityManager = .init(scene: self)
        
        setUpBackground()
        setUpMana()
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
    
    private func setUpMana() {
        entityManager.add(PlayerManaEntity())
        for family in UIFont.familyNames {

            let sName: String = family as String
            print("family: \(sName)")
                    
            for name in UIFont.fontNames(forFamilyName: sName) {
                print("name: \(name as String)")
            }
        }
        
        manaLabel.fontSize = 50
        manaLabel.fontColor = SKColor.white
        manaLabel.position = CGPoint(x: size.width / 2, y: 100)
        manaLabel.zPosition = 1
        manaLabel.horizontalAlignmentMode = .center
        manaLabel.verticalAlignmentMode = .center
        manaLabel.text = "0"
        addChild(manaLabel)
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
            let newSpriteWidth = size.width / 6
            let newSpriteHeight = currentSpriteSize.height / currentSpriteSize.width * newSpriteWidth
            spriteComponent.node.size = .init(width: newSpriteWidth, height: newSpriteHeight)
        }
        
        entityManager.add(enemyEntity)
    }
    
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        
        entityManager.update(with: deltaTime)
        
        if let manaEntity = entityManager
            .entities
            .compactMap({ $0.component(ofType: ManaComponent.self) })
            .first {
            manaLabel.text = "\(manaEntity.manaPoints)"
        }
    }
}
