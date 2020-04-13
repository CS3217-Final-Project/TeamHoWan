//
//  JoinRoomViewNode.swift
//  GameOfRunes
//
//  Created by Jermy on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class JoinRoomViewNode: SKNode {
    let numberPadNode: NumberPadNode
    
    init(size: CGSize) {
        numberPadNode = .init(size: size.scaleTo(width: size.width * 0.525, widthToHeightRatio: 3 / 5), limit: 6)
        super.init()
        
        numberPadNode.position = .init(x: 0.0, y: size.height / 20)
        
        let joinButtonTexture = SKTexture(imageNamed: "join-button")
        let joinButton = ButtonNode(
            size: joinButtonTexture.size().scaleTo(width: size.width * 0.7),
            texture: joinButtonTexture,
            buttonType: .joinButton,
            position: .init(x: 0.0, y: -size.height * 0.375)
        )
        
        addChild(numberPadNode)
        addChild(joinButton)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
