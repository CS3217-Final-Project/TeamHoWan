//
//  PowerUpModel.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

/**
 Model representing Power Ups on the network.
 Conforms to `Codable` so that it can be encoded before being sent over the network and then subsequently decoded.
 */
class PowerUpModel: Codable {
    let uuid: String
    var powerUpType: PowerUpType
    var position: CGPoint
    var size: CGSize?
    
    init(powerUpType: PowerUpType, position: CGPoint, size: CGSize? = nil) {
        self.uuid = Util.generateUuid()
        self.powerUpType = powerUpType
        self.position = position
        self.size = size
    }
}
