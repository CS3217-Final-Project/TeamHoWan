//
//  MoveSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class MoveSystem: GKComponentSystem<MoveComponent>, System {
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        super.init(componentClass: MoveComponent.self)
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        for component in components {
            updateComponent(component)
            // Call to component.update to trigger observer events.
            component.update(deltaTime: seconds)
        }
    }
    
    // Note: end-point entity also has a move component.
    private func updateComponent(_ component: MoveComponent) {
        guard let entity = component.entity,
            let teamComponent = entity.component(ofType: TeamComponent.self),
            let enemyMoveComponent = closestMoveComponent(from: component,
                                                          for: teamComponent.team.oppositeTeam),
            let alliedMoveComponents = gameEngine?.moveComponents(for: teamComponent.team) else {
                return
        }
        
        // Update Entity Movement Behaviour
        component.behavior = MoveBehavior(targetSpeed: component.maxSpeed, seek: enemyMoveComponent,
                                          avoid: alliedMoveComponents)
    }
    
    private func closestMoveComponent(from component: MoveComponent, for team: Team) -> GKAgent2D? {
        var closestMoveComponent: MoveComponent?
        var closestDistance: CGFloat = 0.0
        let isPowerUpImmune = component
            .entity?
            .component(ofType: EnemyTypeComponent.self)?
            .enemyType
            .isPowerUpImmune ?? false
        
        gameEngine?.moveComponents(for: team).forEach {
            if isPowerUpImmune,
                let parent = $0.entity?.component(ofType: ParentEntityComponent.self)?.parent,
                parent.type == .powerUpEntity {
                    return
            }
            
            let distance = component.cgPosition.distance(to: $0.cgPosition)
            if closestMoveComponent == nil || distance < closestDistance {
                closestMoveComponent = $0
                closestDistance = distance
            }
        }
        
        return closestMoveComponent
    }
    
    func addComponent(_ component: Component) {
        guard let component = component as? MoveComponent else {
            return
        }
        
        super.removeComponent(component)
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? MoveComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}

/** Extension for Power Up implementations */
extension MoveSystem {
    func changeMovementSpeed(for entity: Entity, to speed: Float, duration: TimeInterval) {
        guard let entityMoveComponent = entity.component(ofType: MoveComponent.self),
            let enemyType = entity.component(ofType: EnemyTypeComponent.self)?.enemyType else {
            return
        }

        // Hack
        entityMoveComponent.activePauses += 1
        entityMoveComponent.maxSpeed = speed
        Timer.scheduledTimer(withTimeInterval: duration, repeats: false, block: { _ in
            entityMoveComponent.activePauses -= 1
            if entityMoveComponent.activePauses == 0 {
                entityMoveComponent.maxSpeed = entityMoveComponent.initialMaxSpeed
            }
        })
        
        gameEngine?.changeAnimationSpeed(for: entity, duration: duration, to: speed / enemyType.speed,
                                         animationNodeKey: GameConfig.AnimationNodeKey.enemy_walking)
    }
}
