//
//  PowerUpContainerNode.swift
//  GameOfRunes
//
//  Created by Jermy on 15/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class PowerUpContainerNode: SKSpriteNode {
    private static let spacingBetweenPowerUpNodes: CGFloat = 20.0
    var powerUpTypes: [PowerUpType] {
        powerUpNodes.map { $0.powerUpType }
    }
    private var powerUpNodes = [PowerUpNode]()
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutPowerUpNodes()
        }
    }
    var selectedPowerUp: PowerUpType? {
        didSet {
            guard oldValue != selectedPowerUp else {
                return
            }
            
            if let gameScene = gameScene {
                if selectedPowerUp == nil {
                    gameScene.gestureLayer.addChild(gameScene.gestureAreaNode)
                } else {
                    gameScene.gestureAreaNode.removeFromParent()
                }
            }
            
            powerUpNodes.forEach { $0.selected = $0.powerUpType == selectedPowerUp }
        }
    }
    
    weak var gameScene: GameScene?
    
    init(powerUpTypes: [PowerUpType]) {
        super.init(texture: nil, color: .clear, size: .zero)
        
        powerUpTypes.forEach {
            let powerUpNode = PowerUpNode(powerUpType: $0)
            powerUpNode.zPosition = 2
            powerUpNodes.append(powerUpNode)
            addChild(powerUpNode)
        }
        layoutPowerUpNodes()
    }
    
    convenience init(powerUpTypes: PowerUpType...) {
        self.init(powerUpTypes: powerUpTypes)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutPowerUpNodes() {
        let numPowerUpNodes = powerUpNodes.count
        guard numPowerUpNodes > 0 else {
            return
        }
        
        let newPowerUpNodeSize = powerUpNodes[0].size.scaleTo(height: size.height, heightToWidthRatio: 4 / 3)
        powerUpNodes.forEach { $0.size = newPowerUpNodeSize }
        
        let newPowerUpNodeWidth = newPowerUpNodeSize.width
        let intervalVector = CGVector(
            dx: newPowerUpNodeWidth + Self.spacingBetweenPowerUpNodes,
            dy: 0.0
        )
        let numIntervalsPerSide = (numPowerUpNodes - 1) / 2
        var powerUpNodePosition: CGPoint = .zero
            + .init(numIntervalsPerSide) * -intervalVector
            + .init(dx: numPowerUpNodes.isMultiple(of: 2) ? -newPowerUpNodeWidth / 2 : 0.0, dy: 0.0)
        
        powerUpNodes.forEach {
            $0.position = powerUpNodePosition
            powerUpNodePosition += intervalVector
        }
    }
}
