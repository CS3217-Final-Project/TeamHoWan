//
//  MoveComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class MoveComponent: GKAgent2D, GKAgentDelegate, Component {
    private weak var gameEngine: GameEngine?
    var type: ComponentType {
        .moveComponent
    }
    
    init(gameEngine: GameEngine, maxSpeed: Float, maxAcceleration: Float, radius: Float) {
        self.gameEngine = gameEngine
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
    
    override func willRemoveFromEntity() {
        gameEngine?.removeComponent(self)
    }
    
    func stopMovementForDuration(_ duration: TimeInterval) {
        let temp = self.maxSpeed
        self.maxSpeed = 0
        Timer.scheduledTimer(withTimeInterval: duration, repeats: false, block: { _ in
            self.maxSpeed = temp
        })
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
