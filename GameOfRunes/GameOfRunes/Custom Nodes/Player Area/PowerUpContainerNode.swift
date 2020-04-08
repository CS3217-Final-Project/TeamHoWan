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
        didSet {
            guard oldValue != powerUpTypes else {
                return
            }
            buildPowerUpNodes()
            selectedPowerUp = nil
        }
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
            powerUpNodes.forEach { $0.selected = $0.powerUpType == selectedPowerUp }
            if let gameScene = parent?.parent as? GameScene {
                gameScene.updateGameEngineSelectedPowerUp()
            }
        }
    }
    
    init() {
        powerUpTypes = []
        super.init(texture: nil, color: .clear, size: .zero)
        
        buildPowerUpNodes()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildPowerUpNodes() {
        powerUpNodes.forEach { $0.removeFromParent() }
        powerUpNodes = []
        powerUpTypes.forEach {
            let powerUpNode = PowerUpNode(powerUpType: $0)
            powerUpNode.zPosition = 2
            powerUpNodes.append(powerUpNode)
            addChild(powerUpNode)
        }
        layoutPowerUpNodes()
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
