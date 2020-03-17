//
//  SummonNode.swift
//  GameOfRunes
//
//  Created by Jermy on 17/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class SummonNode: SKSpriteNode {
    private static let normalImage = SKTexture(imageNamed: "summon")
    private static let tappedImage = SKTexture(imageNamed: "summon-tapped")
    private static let onTappedScaleFactor: CGFloat = 0.9
    private var responder: TapResponder {
        guard let responder = scene as? TapResponder else {
            fatalError("This node can only be used within a `TapResponder` scene.")
        }
        return responder
    }
    private var identitySize: CGSize
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            identitySize = size
        }
    }
    
    init() {
        let size = Self.normalImage.size()
        identitySize = size
        super.init(texture: Self.normalImage, color: .clear, size: size)
        
        isUserInteractionEnabled = true
        name = ButtonType.summonButton.rawValue
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        texture = Self.tappedImage
        run(.scale(to: Self.onTappedScaleFactor, duration: 0.05))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        texture = Self.normalImage
        run(.scale(to: identitySize, duration: 0.1))
        
        guard let touch = touches.first,
            let playerArea = parent as? PlayerAreaNode,
            playerArea.atPoint(touch.location(in: playerArea)) === self else {
            return
        }
        
        responder.onTapped(tappedNode: self)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        texture = Self.normalImage
        run(.scale(to: identitySize, duration: 0.1))
    }
}
