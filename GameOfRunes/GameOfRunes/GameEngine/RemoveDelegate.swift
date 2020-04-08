//
//  RemoveDelegate.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

protocol RemoveDelegate: AnyObject {
    func removeGesture(for entity: Entity)
    func removeUnit(_ entity: Entity, shouldDecreasePlayerHealth: Bool, shouldIncreaseScore: Bool)
    func removeDroppedMana(_ entity: Entity)
}
