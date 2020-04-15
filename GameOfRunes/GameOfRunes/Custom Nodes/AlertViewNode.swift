//
//  AlertViewNode.swift
//  GameOfRunes
//
//  Created by Jermy on 15/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class AlertViewNode: SKSpriteNode {
    let loaderNode: LoaderNode
    let tickNode: ButtonNode
    let crossNode: ButtonNode
    let statusNode: SKSpriteNode
    let descriptionNode: SKLabelNode = .init(fontNamed: GameConfig.fontName)
    
    var visibleActionNodes: (tick: Bool, cross: Bool) = (false, false) {
        didSet {
            let tickIsVisible = visibleActionNodes.tick
            let crossIsVisible = visibleActionNodes.cross
            
            tickNode.isHidden = !tickIsVisible
            crossNode.isHidden = !crossIsVisible
            
            let yPosition = -size.height * 0.3
            
            if tickIsVisible, crossIsVisible {
                tickNode.position = .init(x: size.width / 6, y: yPosition)
                crossNode.position = .init(x: -size.width / 6, y: yPosition)
            } else if tickIsVisible {
                tickNode.position = .init(x: 0.0, y: yPosition)
            } else if crossIsVisible {
                crossNode.position = .init(x: 0.0, y: yPosition)
            }
        }
    }
    
    init(size: CGSize) {
        let shorterSide = min(size.width, size.height)
        loaderNode = .init(size: size.scaleTo(width: shorterSide / 4, widthToHeightRatio: 1))
        
        tickNode = .init(
            size: size.scaleTo(width: shorterSide / 6, widthToHeightRatio: 1),
            texture: .init(imageNamed: "tick"),
            buttonType: .tickButton
        )
        
        crossNode = .init(
            size: size.scaleTo(width: shorterSide / 6, widthToHeightRatio: 1),
            texture: .init(imageNamed: "mini-cross"),
            buttonType: .crossButton
        )
        
        statusNode = .init(color: .clear, size: size.scaleTo(width: shorterSide / 4, widthToHeightRatio: 1))
        
        super.init(texture: .init(imageNamed: "alert"), color: .clear, size: size)
        
        loaderNode.zPosition = 1
        loaderNode.position = .init(x: 0.0, y: -size.height * 0.05)
        loaderNode.isHidden = true
        
        tickNode.zPosition = 1
        tickNode.isHidden = !visibleActionNodes.tick
        
        crossNode.zPosition = 1
        crossNode.isHidden = !visibleActionNodes.cross
        
        statusNode.zPosition = 1
        statusNode.position = .init(x: 0.0, y: size.height * 0.325)
        statusNode.isHidden = true
        
        descriptionNode.zPosition = 1
        descriptionNode.position = .init(x: 0.0, y: size.height / 8)
        descriptionNode.fontColor = .black
        descriptionNode.fontSize = size.width / 20
        
        addChild(loaderNode)
        addChild(tickNode)
        addChild(crossNode)
        addChild(statusNode)
        addChild(descriptionNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
