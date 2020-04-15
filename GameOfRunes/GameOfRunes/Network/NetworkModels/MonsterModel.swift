//
//  MonsterModel.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

/**
 Model representing a Monsters on the network.
 Conforms to `Codable` so that it can be encoded before being sent over the network and then subsequently decoded.
 */
class MonsterModel: Codable {
    let uuid: String
    var enemyType: EnemyType
    var position: CGPoint
    var gestureType: CustomGesture
    
    init(enemyType: EnemyType, position: CGPoint, gestureType: CustomGesture, uuid: String) {
        self.uuid = uuid
        self.enemyType = enemyType
        self.position = position
        self.gestureType = gestureType
    }
}
