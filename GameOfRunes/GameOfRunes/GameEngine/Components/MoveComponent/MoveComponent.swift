//
//  MoveComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class MoveComponent: GKAgent2D, GKAgentDelegate {
    init(maxSpeed: Float, maxAcceleration: Float, radius: Float) {
        super.init()
        delegate = self
        self.maxSpeed = maxSpeed
        self.maxAcceleration = maxAcceleration
        self.radius = radius
        self.mass = 0.01
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func agentWillUpdate(_ agent: GKAgent) {
        guard let spriteComponent = entity?.component(ofType: SpriteComponent.self) else {
            return
        }
        
        cgPosition = spriteComponent.node.position
    }
    
    func agentDidUpdate(_ agent: GKAgent) {
        guard let spriteComponent = entity?.component(ofType: SpriteComponent.self) else {
            return
        }
        
        spriteComponent.node.position = cgPosition
    }
}
