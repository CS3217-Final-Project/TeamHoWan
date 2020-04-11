//
//  Collision.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

protocol Collision {
    func resolveCollision(firstEntity: Entity, secondEntity: Entity)
}
