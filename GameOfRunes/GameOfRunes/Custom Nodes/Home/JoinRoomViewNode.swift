//
//  JoinRoomViewNode.swift
//  GameOfRunes
//
//  Created by Jermy on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class JoinRoomViewNode: SKNode {
    private let numberPadNode: NumberPadNode
    private let joinButton: ButtonNode
    var inputRoomId: String {
        get {
            numberPadNode.displayedValue
        }
        set {
            numberPadNode.displayedValue = newValue
        }
    }
    
    override var isUserInteractionEnabled: Bool {
        didSet {
            numberPadNode.isUserInteractionEnabled = isUserInteractionEnabled
            joinButton.isUserInteractionEnabled = isUserInteractionEnabled
        }
    }
    
    init(size: CGSize) {
        numberPadNode = .init(size: size.scaleTo(width: size.width * 0.525, widthToHeightRatio: 3 / 5.75), limit: 5)
        numberPadNode.position = .init(x: 0.0, y: size.height / 10)
        numberPadNode.header = "Room ID"
        
        let joinButtonTexture = SKTexture(imageNamed: "join-button")
        joinButton = ButtonNode(
            size: joinButtonTexture.size().scaleTo(width: size.width * 0.775),
            texture: joinButtonTexture,
            buttonType: .joinButton,
            position: .init(x: 0.0, y: -size.height * 0.39)
        )
        
        super.init()
        
        isUserInteractionEnabled = true
        
        addChild(numberPadNode)
        addChild(joinButton)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
