//
//  SpriteSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class SpriteSystem: GKComponentSystem<SpriteComponent>, System {
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        super.init(componentClass: SpriteComponent.self)
    }
    
    override func addComponent(foundIn entity: GKEntity) {
        super.addComponent(foundIn: entity)

        guard let spriteComponent = entity.component(ofType: SpriteComponent.self),
            let renderNode = gameEngine?.rootRenderNode else {
            return
        }

        renderNode.addNodeToLayer(layer: spriteComponent.layerType,
                                  node: spriteComponent.node)
    }
    
    override func removeComponent(foundIn entity: GKEntity) {
        super.removeComponent(foundIn: entity)
        entity.component(ofType: SpriteComponent.self)?.node.removeFromParent()
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? SpriteComponent else {
            return
        }
        
        super.removeComponent(component)
    }
    
    func runFadingAnimation(_ entity: Entity) {
        guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else {
                return
        }

        spriteComponent.node.run(.fadeOut(withDuration: 0.25))
    }
    
    func changeAnimationSpeed(for entity: Entity, duration: TimeInterval, to speed: Float, animationNodeKey: String) {
        guard let entitySpriteComponent = entity.component(ofType: SpriteComponent.self),
            let animation = entitySpriteComponent.node.action(forKey: animationNodeKey) else {
                return
        }
        
        // Hack
        entitySpriteComponent.activePauses += 1
        animation.speed = CGFloat(speed)
        Timer.scheduledTimer(withTimeInterval: duration, repeats: false, block: { _ in
            entitySpriteComponent.activePauses -= 1
            if entitySpriteComponent.activePauses == 0 {
                animation.speed = 1
            }
        })
    }
    
    func activateInvincibleEndPoint(for entity: Entity) {
        guard entity.type == .endPointEntity,
            let node = entity.component(ofType: SpriteComponent.self)?.node as? SKSpriteNode,
            gameEngine?.isDivineShieldActivated == true else {
                return
        }
        
        node.removeGlow()
        node.texture = SKTexture(imageNamed: "finish-line-invulnerability")
        node.addGlow()
    }
    
    func deactivateInvincibleEndPoint(for entity: Entity) {
        guard entity.type == .endPointEntity,
            let node = entity.component(ofType: SpriteComponent.self)?.node as? SKSpriteNode,
            gameEngine?.isDivineShieldActivated == false else {
                return
        }
        
        node.removeGlow()
        node.texture = SKTexture(imageNamed: "finish-line")
        node.addGlow()
    }
}
