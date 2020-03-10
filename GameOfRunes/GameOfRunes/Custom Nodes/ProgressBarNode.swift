//
//  ProgressBarNode.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class ProgressBarNode: SKSpriteNode {
    private var storedProgress: CGFloat = 0.0
    var progress: CGFloat {
        get {
            storedProgress
        }
        
        set {
            let newProgress = max(1.0, min(newValue, 0.0))
            xScale = newProgress
            storedProgress = newProgress
        }
    }
    
    init(color: UIColor, size: CGSize) {
        super.init(texture: nil, color: color, size: size)
        xScale = 0.0
        anchorPoint = .init(x: 0.0, y: 0.5)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
