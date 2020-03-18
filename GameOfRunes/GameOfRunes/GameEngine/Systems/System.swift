//
//  System.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

protocol System: AnyObject {
    func update(deltaTime: TimeInterval)
    func addComponent(foundIn: GKEntity)
    func removeComponent(foundIn: GKEntity)
    func removeComponent(_ component: Component)
}
