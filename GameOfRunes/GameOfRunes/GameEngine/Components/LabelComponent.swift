//
//  TimerComponent.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 16/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

class LabelComponent: GKComponent, Component {
    private let labelNode: SKLabelNode
    var label: String {
        get {
            labelNode.text ?? ""
        }
        set {
            labelNode.text = newValue
        }
    }
    
    var type: ComponentType {
        .labelComponent
    }
    
    func decreaseOpacity() {
        labelNode.alpha -= 1/120
    }
    
    init(labelNode: SKLabelNode) {
        self.labelNode = labelNode
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
