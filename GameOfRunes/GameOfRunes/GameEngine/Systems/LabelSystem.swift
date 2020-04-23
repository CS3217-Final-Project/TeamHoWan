//
//  TimerSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 16/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class LabelSystem: GKComponentSystem<LabelComponent>, System {
    private weak var gameEngine: GameEngine?
    
    init(gameEngine: GameEngine) {
        self.gameEngine = gameEngine
        super.init(componentClass: LabelComponent.self)
    }
    
    override func addComponent(foundIn entity: GKEntity) {
        super.addComponent(foundIn: entity)
        
        guard let labelComponent = entity.component(ofType: LabelComponent.self),
            let rootRenderNode = gameEngine?.rootRenderNode else {
            return
        }
        
        rootRenderNode.addNodeToLayer(layer: labelComponent.layerType, node: labelComponent.node)
    }
    
    func setLabel(entity: Entity, label: String) {
        guard let labelComponent = entity.component(ofType: LabelComponent.self) else {
            return
        }
        labelComponent.label = label
    }

    func decreaseLabelOpacity(_ entity: Entity) {
        guard let labelComponent = entity.component(ofType: LabelComponent.self) else {
            return
        }
        labelComponent.decreaseOpacity()
    }
    
    func incrementLabelIntegerValue(_ entity: Entity) {
        guard let labelComponent = entity.component(ofType: LabelComponent.self),
            let oldValue = Int(labelComponent.label) else {
            return
        }
        let newValue = oldValue + 1
        labelComponent.resetOpacity()
        labelComponent.label = "\(newValue)"
        if entity is ComboEntity, newValue.isMultiple(of: 10) {
            gameEngine?.incrementMultiplier()
        }
    }
    
    override func removeComponent(foundIn entity: GKEntity) {
        super.removeComponent(foundIn: entity)
        entity.component(ofType: LabelComponent.self)?.node.removeFromParent()
    }
    
    func addComponent(_ component: Component) {
        guard let component = component as? LabelComponent else {
            return
        }
        
        super.addComponent(component)
    }
    
    func removeComponent(_ component: Component) {
        guard let component = component as? LabelComponent else {
            return
        }
        
        super.removeComponent(component)
    }
}
