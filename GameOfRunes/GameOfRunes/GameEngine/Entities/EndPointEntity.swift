//
//  EndPointEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class EndPointEntity: Entity {
    override var type: EntityType {
        .endPointEntity
    }
    
    init(node: SKSpriteNode, team: Team) {
        super.init()
        
        let collisionType: CollisionType = team == .player ? .playerEndPoint : .enemyEndPoint
        collisionType.setPhysicsBody(for: node, with: node.size)
        
        let spriteComponent = SpriteComponent(node: node, layerType: .playerAreaLayer)
        
        var attractionEntities = [AttractionEntity]()
        
        // set up the attractive force of end point
        
        for laneIndex in 0..<GameConfig.GamePlayScene.numEndPoints {
            let attractionNode = SKSpriteNode(color: .clear, size: .zero)
            
            attractionNode.position = GameConfig.GamePlayScene.calculateHorizontallyDistributedPoints(
                width: node.size.width,
                laneIndex: laneIndex,
                totalPoints: GameConfig.GamePlayScene.numEndPoints,
                yPosition: node.position.y
            )

            let attractionEntity = AttractionEntity(
                node: attractionNode,
                layerType: .playerAreaLayer,
                team: team,
                parent: self
            )
            
            attractionEntities.append(attractionEntity)
        }
        
        let attractionEntitiesComponent = AttractionEntitiesComponent(attractionEntities)
        
        addComponent(spriteComponent)
        addComponent(attractionEntitiesComponent)
    }
}
