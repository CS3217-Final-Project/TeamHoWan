//
//  BarDividerNode.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class BarDividerNode: SKSpriteNode {
    var active: Bool {
        didSet {
            color = active ? glowColor ?? normalColor : normalColor
        }
    }
    private var normalColor: UIColor
    private var glowColor: UIColor?
    
    init(color: UIColor, glowColor: UIColor?, size: CGSize = .zero, active: Bool = false) {
        self.normalColor = color
        self.glowColor = glowColor
        self.active = active
        super.init(texture: nil, color: active ? glowColor ?? color : color, size: size)
    }
        
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
