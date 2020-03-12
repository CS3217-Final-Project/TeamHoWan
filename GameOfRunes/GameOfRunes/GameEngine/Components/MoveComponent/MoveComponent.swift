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
    weak var gameEngine: GameEngine?
    
    init(maxSpeed: Float, maxAcceleration: Float, radius: Float, gameEngine: GameEngine) {
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
    
    private func closestMoveComponent(for team: Team) -> GKAgent2D? {
        var closestMoveComponent: MoveComponent?
        var closestDistance: CGFloat = 0.0
        
        let targetMoveComponents = gameEngine?.moveComponents(for: team) ?? []
        targetMoveComponents.forEach {
            let distance = cgPosition.distance(to: $0.cgPosition)
            if closestMoveComponent == nil || distance < closestDistance {
                closestMoveComponent = $0
                closestDistance = distance
            }
        }
        
        return closestMoveComponent
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        guard let entity = entity,
            let teamComponent = entity.component(ofType: TeamComponent.self),
            let enemyMoveComponent = closestMoveComponent(for: teamComponent.team.oppositeTeam),
            let gameEngine = gameEngine,
            let endpointComponent = gameEngine.entities(for: .player).first as? EndPointEntity,
            let endpointNode = endpointComponent.component(ofType: SpriteComponent.self)?.node else {
                return
        }
        let alliedMoveComponents = gameEngine.moveComponents(for: teamComponent.team)
        
        behavior = MoveBehavior(targetSpeed: maxSpeed, seek: enemyMoveComponent, avoid: alliedMoveComponents)
        
        for enemyEntity in gameEngine.entities(for: .enemy) {
            guard let enemySpriteComponent = enemyEntity.component(ofType: SpriteComponent.self) else {
                continue
            }
            
            if enemySpriteComponent
                .node
                .calculateAccumulatedFrame()
                .intersects(endpointNode.calculateAccumulatedFrame()) {
                gameEngine.enemyReachedLine(enemyEntity)
            }
        }
    }
}
