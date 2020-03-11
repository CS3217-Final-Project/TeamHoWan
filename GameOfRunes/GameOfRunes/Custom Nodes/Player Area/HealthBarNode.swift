//
//  HealthBarNode.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class HealthBarNode: SKSpriteNode {
    private static let spacingBetweenHealthNodes: CGFloat = 10.0
    private var _totalLives: Int {
        didSet {
            guard oldValue != _totalLives else {
                return
            }
            buildHealthNodes()
        }
    }
    private var _livesLeft: Int {
        didSet {
            (0..<_totalLives).forEach { healthNodes[$0].active = $0 < _livesLeft }
        }
    }
    var totalLives: Int {
        get {
            _totalLives
        }
        set {
            _totalLives = max(1, newValue)
        }
    }
    var livesLeft: Int {
        get {
            _livesLeft
        }
        set {
            _livesLeft = max(0, min(_totalLives, newValue))
        }
    }
    private var healthNodes = [HealthNode]()
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutHealthNodes()
        }
    }
    
    init(totalLives: Int = 3) {
        _totalLives = max(1, totalLives)
        _livesLeft = _totalLives
        let texture = SKTexture(imageNamed: "health-container")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        buildHealthNodes()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildHealthNodes() {
        healthNodes.forEach { $0.removeFromParent() }
        healthNodes = []
        (0..<self._totalLives).forEach { _ in
            let healthNode = HealthNode()
            healthNode.zPosition = 1
            healthNodes.append(healthNode)
            self.addChild(healthNode)
        }
        layoutHealthNodes()
        // ensures _livesLeft <= new totalLives
        livesLeft = _livesLeft
    }
    
    private func layoutHealthNodes() {
        let numHealthNodes = healthNodes.count
        guard numHealthNodes > 0 else {
            return
        }
        
        let newHealthNodeSize = healthNodes[0].size.scaleTo(height: size.height * 0.65)
        healthNodes.forEach { $0.size = newHealthNodeSize }
        
        let newHealthNodeWidth = newHealthNodeSize.width
        let intervalVector = CGVector(
            dx: newHealthNodeWidth + Self.spacingBetweenHealthNodes,
            dy: 0.0
        )
        let numIntervalsPerSide = (numHealthNodes - 1) / 2
        var healthNodePosition: CGPoint = .zero
            + .init(numIntervalsPerSide) * -intervalVector
            + .init(dx: numHealthNodes.isMultiple(of: 2) ? -newHealthNodeWidth / 2 : 0.0, dy: 0.0)
        
        healthNodes.forEach {
            $0.position = healthNodePosition
            healthNodePosition += intervalVector
        }
    }
}
