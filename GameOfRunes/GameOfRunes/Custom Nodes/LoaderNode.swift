//
//  LoaderNode.swift
//  GameOfRunes
//
//  Created by Jermy on 15/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class LoaderNode: SKSpriteNode {
    private let spinnerNode: SKSpriteNode = .init(imageNamed: "spinner")
    
    override var size: CGSize {
        didSet {
            spinnerNode.size = size
        }
    }
    
    init(size: CGSize) {
        super.init(texture: .init(imageNamed: "loading"), color: .clear, size: size)
        
        spinnerNode.run(.repeatForever(.rotate(byAngle: -.pi / 2, duration: 0.2)))
        
        addChild(spinnerNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
