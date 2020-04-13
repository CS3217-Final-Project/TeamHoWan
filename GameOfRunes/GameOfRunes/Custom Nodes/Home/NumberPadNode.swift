//
//  NumberPadNode.swift
//  GameOfRunes
//
//  Created by Jermy on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class NumberPadNode: SKSpriteNode, TapResponder {
    private let displayLabelNode: NumberPadLabelNode = .init()
    var displayValue: String {
        get {
            displayLabelNode.displayLabel
        }
        set {
            displayLabelNode.displayLabel = newValue
        }
    }
    private var _limit = 1
    var limit: Int {
        get {
            _limit
        }
        set {
            _limit = max(1, newValue)
        }
    }
    private lazy var numberPadButtonNodes: [[NumberPadButtonNode]] = {
        var nodes = [[NumberPadButtonNode]]()
        
        let numberNodeTexture = SKTexture(imageNamed: "number-button")
        let numberNodes: [NumberPadButtonNode] = (0...9).map {
            let node = NumberPadButtonNode(backgroundTexture: numberNodeTexture, feedbackValue: "\($0)")
            node.displayValue = node.feedbackValue
            node.numberPadButtonResponder = self
            node.zPosition = 1
            return node
        }
        
        let deleteNode: NumberPadButtonNode = .init(
            backgroundTexture: .init(imageNamed: "delete-button"),
            feedbackValue: "<-"
        )
        deleteNode.numberPadButtonResponder = self
        deleteNode.zPosition = 1
        
        let clearNode: NumberPadButtonNode = .init(
            backgroundTexture: .init(imageNamed: "clear-button"),
            feedbackValue: "X"
        )
        clearNode.numberPadButtonResponder = self
        clearNode.zPosition = 1
        
        nodes.append([numberNodes[1], numberNodes[2], numberNodes[3]])
        nodes.append([numberNodes[4], numberNodes[5], numberNodes[6]])
        nodes.append([numberNodes[7], numberNodes[8], numberNodes[9]])
        nodes.append([deleteNode, numberNodes[0], clearNode])
        
        return nodes
    }()
    
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutDisplayLabelNode()
            layoutNumberPadButtonNodes()
        }
    }
    
    init(size: CGSize, limit: Int) {
        super.init(texture: nil, color: .clear, size: size)
        
        self.limit = limit
        
        displayLabelNode.zPosition = 1
        addChild(displayLabelNode)
        numberPadButtonNodes.forEach { row in row.forEach { node in addChild(node) } }
    }
    
    func onTapped(tappedNode: ButtonNode) {
        guard let numberPadButtonNode = tappedNode as? NumberPadButtonNode else {
            return
        }
        
        switch numberPadButtonNode.feedbackValue {
        case "<-":
            displayValue = String(displayValue.dropLast())
        case "X":
            displayValue = ""
        default:
            guard displayValue.count < limit else {
                return
            }
            displayValue += numberPadButtonNode.feedbackValue
        }
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutDisplayLabelNode() {
        displayLabelNode.size = size.scaleTo(height: size.width / 3, heightToWidthRatio: 1 / 4.5)
        displayLabelNode.position = .init(x: 0.0, y: (size.height - displayLabelNode.size.height) / 2)
    }
    
    private func layoutNumberPadButtonNodes() {
        let nodeSize = CGSize(width: size.width / 3, height: size.width / 3)
        
        for (i, row) in numberPadButtonNodes.enumerated() {
            row.forEach { $0.size = nodeSize }
            
            let yPosition = -size.height / 2 + (3.5 - .init(i)) * nodeSize.height
            
            row[0].position = .init(x: -nodeSize.width, y: yPosition)
            row[1].position = .init(x: 0.0, y: yPosition)
            row[2].position = .init(x: nodeSize.width, y: yPosition)
        }
    }
}
