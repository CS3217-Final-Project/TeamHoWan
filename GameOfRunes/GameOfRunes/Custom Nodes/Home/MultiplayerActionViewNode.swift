//
//  MultiplayerActionViewNode.swift
//  GameOfRunes
//
//  Created by Jermy on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class MultiplayerActionViewNode: SKNode {
    let hostRoomButton: ButtonNode
    let joinRoomButton: ButtonNode
    
    override var isUserInteractionEnabled: Bool {
        didSet {
            hostRoomButton.isUserInteractionEnabled = isUserInteractionEnabled
            hostRoomButton.alpha = isUserInteractionEnabled ? 1 : 0.7
            
            joinRoomButton.isUserInteractionEnabled = isUserInteractionEnabled
            joinRoomButton.alpha = isUserInteractionEnabled ? 1 : 0.7
        }
    }
    
    init(size: CGSize) {
        let hostRoomButtonTexture = SKTexture(imageNamed: "host-room-button")
        hostRoomButton = ButtonNode(
            size: hostRoomButtonTexture.size().scaleTo(height: size.width * 0.4),
            texture: hostRoomButtonTexture,
            buttonType: .hostRoomButton,
            position: .init(x: -size.width * 0.225, y: 0.0)
        )
        
        let joinRoomButtonTexture = SKTexture(imageNamed: "join-room-button")
        joinRoomButton = ButtonNode(
            size: joinRoomButtonTexture.size().scaleTo(height: size.width * 0.4),
            texture: joinRoomButtonTexture,
            buttonType: .joinRoomButton,
            position: .init(x: size.width * 0.225, y: 0.0)
        )
        super.init()
        
        addChild(hostRoomButton)
        addChild(joinRoomButton)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
