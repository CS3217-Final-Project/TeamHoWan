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

        guard let spriteComponent = entity.component(ofType: SpriteComponent.self) else {
            return
        }
        gameEngine?.gameScene?.addNodeToLayer(layer: spriteComponent.layerType, node: spriteComponent.node)
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
}
