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
    
    init(node: SKSpriteNode) {
        super.init()
        
        CollisionType.endpoint.setPhysicsBody(for: node, with: node.size)
        node.addGlow()
        
        let spriteComponent = SpriteComponent(node: node, layerType: .playerAreaLayer)
        
        var attractionEntities = [AttractionEntity]()
        
        // set up the attractive force of end point
        
        for laneIndex in 0..<GameConfig.GamePlayScene.numEndPoints {
            // finds xPosition of attraction node
            let xPositionNumerator = 2 * laneIndex + 1
            let xPositionDenominator = 2 * GameConfig.GamePlayScene.numEndPoints
            let xPositionRatio = CGFloat(xPositionNumerator) / CGFloat(xPositionDenominator)
            let edgeOffset = GameConfig.GamePlayScene.horizontalOffSet
            let xPosition = (.init(node.size.width) - 2 * edgeOffset) * xPositionRatio + edgeOffset
            
            let attractionNode = SKSpriteNode(color: .clear, size: .zero)
            attractionNode.position = .init(x: xPosition, y: node.position.y)

            let attractionEntity = AttractionEntity(
                node: attractionNode,
                layerType: .playerAreaLayer,
                team: .player,
                parent: self
            )
            
            attractionEntities.append(attractionEntity)
        }
        
        let attractionEntitiesComponent = AttractionEntitiesComponent(attractionEntities)
        
        addComponent(spriteComponent)
        addComponent(attractionEntitiesComponent)
    }
}
