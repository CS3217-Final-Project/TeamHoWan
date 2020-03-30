//
//  TimerComponent.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 16/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class LabelComponent: GKComponent, Component {
    let node: SKLabelNode
    var label: String {
        get {
            node.text ?? ""
        }
        set {
            node.text = newValue
        }
    }
    
    var type: ComponentType {
        .labelComponent
    }
    let layerType: SpriteLayerType = .highestPriorityLayer
    
    func decreaseOpacity() {
        node.alpha -= 1 / 120
    }
    
    func resetOpacity() {
        node.alpha = 1
    }
    
    init(node: SKLabelNode) {
        self.node = node
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
