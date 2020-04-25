//
//  ProgressBarNode.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class ProgressBarNode: SKSpriteNode {
    private var _progress: CGFloat = 0.0
    var progress: CGFloat {
        get {
            _progress
        }
        set {
            _progress = max(0.0, min(1.0, newValue))
            updateProportion()
        }
    }
    
    private var _maxWidth: CGFloat
    var maxWidth: CGFloat {
        get {
            _maxWidth
        }
        set {
            _maxWidth = max(0.0, newValue)
            updateProportion()
        }
    }
    
    init(color: UIColor, size: CGSize) {
        _maxWidth = max(0.0, size.width)
        super.init(texture: nil, color: color, size: size)
        anchorPoint = .init(x: 0.0, y: 0.5)
        updateProportion()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateProportion() {
        size.width = _maxWidth * _progress
    }
}
