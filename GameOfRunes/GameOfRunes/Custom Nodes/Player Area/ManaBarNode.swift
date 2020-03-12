//
//  ManaBarNode.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class ManaBarNode: SKSpriteNode {
    private var _numManaUnits: Int {
        didSet {
            guard oldValue != _numManaUnits else {
                return
            }
            buildBarDividers()
            // ensures _currentManaPoints <= new totalManaPoints
            currentManaPoints = _currentManaPoints
            updateProgress()
            updateLitBars()
        }
    }
    var numManaUnits: Int {
        get {
            _numManaUnits
        }
        set {
            _numManaUnits = max(1, newValue)
        }
    }
    
    private var _manaPointsPerUnit: Int {
        didSet {
            guard oldValue != _manaPointsPerUnit else {
                return
            }
            // ensures _currentManaPoints <= new totalManaPoints
            currentManaPoints = _currentManaPoints
            updateProgress()
            updateLitBars()
        }
    }
    var manaPointsPerUnit: Int {
        get {
            _manaPointsPerUnit
        }
        set {
            _manaPointsPerUnit = max(1, newValue)
        }
    }
    
    private var _currentManaPoints: Int {
        didSet {
            guard oldValue != _currentManaPoints else {
                return
            }
            updateProgress()
            
            guard _currentManaPoints / _manaPointsPerUnit != lastLitBar else {
                return
            }
            updateLitBars()
        }
    }
    var currentManaPoints: Int {
        get {
            _currentManaPoints
        }
        set {
            _currentManaPoints = max(0, min(newValue, totalManaPoints))
        }
    }
    
    var totalManaPoints: Int {
        _numManaUnits * _manaPointsPerUnit
    }
    
    override var size: CGSize {
        didSet {
            layoutProgressBar()
            layoutBarDividers()
        }
    }
    var manaColor: UIColor {
        didSet {
            guard oldValue != manaColor else {
                return
            }
            progressBarNode.color = manaColor
        }
    }
    private lazy var progressBarNode = ProgressBarNode(color: manaColor, size: texture?.size() ?? .zero)
    private var barDividerNodes = [BarDividerNode]()
    private var lastLitBar = 0
    
    init(
        numManaUnits: Int = 5,
        manaPointsPerUnit: Int = 10,
        initialManaPoints: Int = 0,
        manaColor: UIColor = .init(hex: "#4ce2ff", alpha: 1.0)
    ) {
        _numManaUnits = max(1, numManaUnits)
        _manaPointsPerUnit = max(1, manaPointsPerUnit)
        _currentManaPoints = initialManaPoints
        self.manaColor = manaColor
        let texture = SKTexture(imageNamed: "mana-container")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        buildProgressBar()
        buildBarDividers()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateProgress() {
        progressBarNode.progress = .init(_currentManaPoints) / .init(totalManaPoints)
    }
    
    private func updateLitBars() {
        lastLitBar = _currentManaPoints / _manaPointsPerUnit
        (0..<barDividerNodes.count).forEach { barDividerNodes[$0].active = $0 < lastLitBar }
    }
    
    private func buildProgressBar() {
        progressBarNode.zPosition = -2
        addChild(progressBarNode)
        layoutProgressBar()
    }
    
    private func buildBarDividers() {
        barDividerNodes.forEach { $0.removeFromParent() }
        barDividerNodes = []
        (0..<self._numManaUnits - 1).forEach { _ in
            let barDividerNode = BarDividerNode(color: .gray, glowColor: .white)
            barDividerNode.zPosition = -1
            barDividerNodes.append(barDividerNode)
            addChild(barDividerNode)
        }
        layoutBarDividers()
    }
    
    private func layoutProgressBar() {
        // position the start of the progress bar to be inline with the window
        progressBarNode.position = .zero + .init(dx: -size.width * 0.35, dy: 0.5)
        progressBarNode.size.height = size.height * 0.7
        progressBarNode.maxWidth = size.width * 0.7
    }
    
    private func layoutBarDividers() {
        let numBarDividerNodes = barDividerNodes.count
        guard numBarDividerNodes > 0 else {
            return
        }
        
        let newBarDividerNodeSize = CGSize(width: 3, height: size.height * 0.7)
        barDividerNodes.forEach { $0.size = newBarDividerNodeSize }
        
        let newBarDividerNodeWidth = newBarDividerNodeSize.width
        let spacingBetweenBarDividerNode = (
            size.width * 0.7 - .init(numBarDividerNodes) * newBarDividerNodeWidth
            ) / .init(numManaUnits)
        let intervalVector = CGVector(
            dx: newBarDividerNodeWidth + spacingBetweenBarDividerNode,
            dy: 0.0
        )
        
        var barDividerNodePosition: CGPoint = .zero
            + .init(dx: -size.width * 0.35, dy: 0.0)
            + .init(dx: spacingBetweenBarDividerNode + newBarDividerNodeWidth / 2, dy: 0.0)
        
        barDividerNodes.forEach {
            $0.position = barDividerNodePosition
            barDividerNodePosition += intervalVector
        }
    }
}
