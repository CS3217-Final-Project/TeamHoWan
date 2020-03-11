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
    var playerAreaNode: PlayerAreaNode!
    
    override func sceneDidLoad() {
        entityManager = .init(scene: self)
        
        setUpArenaLayout()
        setUpEndPoint()
        setUpMana()
    }
    
    private func setUpArenaLayout() {
        // Add background
        let backgroundNode = SKSpriteNode(
            texture: .init(imageNamed: ArenaType.arena2.rawValue),
            color: .clear,
            size: size
        )
        backgroundNode.position = .init(x: size.width / 2, y: size.height / 2)
        backgroundNode.zPosition = -1
        addChild(backgroundNode)
        
        // Add player area
        let playerAreaWidth = size.width
        let playerAreaHeight = size.height / 6
        playerAreaNode = .init(
            size: .init(width: playerAreaWidth, height: playerAreaHeight),
            position: .init(x: playerAreaWidth / 2, y: playerAreaHeight / 2)
        )
        playerAreaNode.zPosition = 100
        addChild(playerAreaNode)
    }
    
    private func setUpEndPoint() {
        let endPointEntity = EndPointEntity(entityManger: entityManager)
        
        if let spriteComponent = endPointEntity.component(ofType: SpriteComponent.self) {
            let newSpriteWidth = size.width
            let newSpriteHeight = size.height / 40
            spriteComponent.node.size = .init(width: newSpriteWidth, height: newSpriteHeight)
            spriteComponent.node.position = playerAreaNode.position
                + .init(dx: 0.0, dy: (playerAreaNode.size.height + newSpriteHeight) / 2)
            spriteComponent.node.zPosition = playerAreaNode.zPosition
        }
        
        entityManager.add(endPointEntity)
    }
    
    private func setUpMana() {
        entityManager.add(PlayerManaEntity())
        
        manaLabel.fontSize = 50
        manaLabel.fontColor = SKColor.white
        manaLabel.position = CGPoint(x: size.width / 2, y: 50)
        manaLabel.zPosition = 200
        manaLabel.horizontalAlignmentMode = .center
        manaLabel.verticalAlignmentMode = .center
        manaLabel.text = "0"
        addChild(manaLabel)
    }
    
    func removeMonstersWithGesture(gesture: CustomGesture) {
        entityManager.removeMonstersWithGesture(gesture: gesture)
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
            playerAreaNode.manaBarNode.currentManaPoints = manaEntity.manaPoints
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        entityManager.spawnEnemy()
    }
}
