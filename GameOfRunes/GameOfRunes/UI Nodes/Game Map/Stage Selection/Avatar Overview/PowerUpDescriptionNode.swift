//
//  PowerUpDescriptionNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class PowerUpDescriptionNode: SKSpriteNode {
    let powerUpContainerNode = PowerUpContainerNode()
    let descriptionNode = DescriptionNode()
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutPowerUpContainerNode()
            layoutDescriptionNode()
        }
    }
    
    init() {
        super.init(texture: nil, color: .clear, size: .zero)
        
        powerUpContainerNode.responder = self
        
        addChild(powerUpContainerNode)
        addChild(descriptionNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutPowerUpContainerNode() {
        powerUpContainerNode.size = size.applying(.init(scaleX: 1.0, y: 0.45))
        powerUpContainerNode.position = .init(x: 0.0, y: (size.height - powerUpContainerNode.size.height) / 2)
    }
    
    private func layoutDescriptionNode() {
        descriptionNode.size = size.applying(.init(scaleX: 1.0, y: 0.55))
        descriptionNode.position = .init(x: 0.0, y: (-size.height + powerUpContainerNode.size.height) / 2)
    }
}

extension PowerUpDescriptionNode: PowerUpContainerResponder {
    func selectedPowerUpDidChanged(newValue: PowerUpType?) {
        var description = newValue?
            .powerUp
            .description
            .components(separatedBy: "\n") ?? ["", "", ""]
        while description.count < 3 {
            description.append("")
        }
        descriptionNode.titleLabelNode.text = description[0]
        descriptionNode.topLabelNode.text = description[1]
        descriptionNode.bottomLabelNode.text = description[2]
    }
}
