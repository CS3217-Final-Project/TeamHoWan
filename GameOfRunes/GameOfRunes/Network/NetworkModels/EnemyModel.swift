//
//  EnemyModel.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

/**
 Model representing a Monsters on the network.
 Conforms to `Codable` so that it can be encoded before being sent over the network and then subsequently decoded.
 */
class EnemyModel: Codable {
    let uuid: String
    var enemyType: EnemyType
    var position: CGPoint
    var gestureType: CustomGesture
    var isTinted: Bool
    
    init(enemyType: EnemyType, position: CGPoint, gestureType: CustomGesture, uuid: String, isTinted: Bool = false) {
        self.uuid = uuid
        self.enemyType = enemyType
        self.position = position
        self.gestureType = gestureType
        self.isTinted = false
    }
    
    init?(_ entity: Entity, uuid: String?, playAreaSize: CGSize) {
        guard entity.type == .enemyEntity,
            let uuid = uuid,
            let enemyType = entity.component(ofType: EnemyTypeComponent.self)?.enemyType,
            let spriteComponent = entity.component(ofType: SpriteComponent.self),
            let gestureEntity = entity.component(ofType: GestureEntityComponent.self)?.gestureEntity,
            let gesture = gestureEntity.component(ofType: GestureComponent.self)?.gesture else {
                return nil
        }
        
        self.uuid = uuid
        self.enemyType = enemyType
        self.position = spriteComponent.node.position
        self.position = CGPoint(x: position.x / playAreaSize.width, y: position.y / playAreaSize.height)
        self.gestureType = gesture
        self.isTinted = spriteComponent.isTinted
    }
}
