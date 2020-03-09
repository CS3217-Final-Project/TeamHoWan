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
    let manaLabel = SKLabelNode(fontNamed: "DragonFire")
    
    override func sceneDidLoad() {
        entityManager = .init(scene: self)
        
        setUpBackground()
        setUpEndPoint()
        setUpMana()
    }
    
    private func setUpBackground() {
        let backgroundEntity = BackgroundEntity(arenaType: .arena2)
        
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
    
    private func setUpEndPoint() {
        let endPointEntity = EndPointEntity()
        
        if let spriteComponent = endPointEntity.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = .init(
                x: size.width / 2,
                y: 150
            )
            let newSpriteWidth = size.width
            let newSpriteHeight = spriteComponent.heightToWidthRatio * newSpriteWidth
            spriteComponent.node.size = .init(width: newSpriteWidth, height: newSpriteHeight)
        }
        
        entityManager.add(endPointEntity)
    }
    
    private func setUpMana() {
        entityManager.add(PlayerManaEntity())
        
        manaLabel.fontSize = 50
        manaLabel.fontColor = SKColor.white
        manaLabel.position = CGPoint(x: size.width / 2, y: 100)
        manaLabel.zPosition = 1
        manaLabel.horizontalAlignmentMode = .center
        manaLabel.verticalAlignmentMode = .center
        manaLabel.text = "0"
        addChild(manaLabel)
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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        entityManager.spawnEnemy()
        print("test")
    }
}
