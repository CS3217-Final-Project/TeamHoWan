//
//  AvatarSelectionNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class AvatarSelectionNode: SKSpriteNode {
    let leftArrowNode = ArrowNode(buttonType: .leftButton)
    let rightArrowNode = ArrowNode(buttonType: .rightButton)
    let avatarSpriteNode = SKSpriteNode()
    
    var avatar: Avatar? {
        didSet {
            guard let avatar = avatar, oldValue != avatar else {
                return
            }
            
            avatarSpriteNode.run(
                .repeatForever(
                    .animate(
                        with: TextureContainer.getAvatarTextures(avatar: avatar),
                        timePerFrame: 0.1
                    )
                )
            )
        }
    }
    override var size: CGSize {
        didSet {
            guard oldValue != size else {
                return
            }
            layoutLeftArrowNode()
            layoutRightArrowNode()
            layoutAvatarSpriteNode()
        }
    }
    
    init() {
        super.init(texture: nil, color: .clear, size: .zero)
        
        avatarSpriteNode.color = .darkGray
        
        leftArrowNode.zPosition = 2
        rightArrowNode.zPosition = 2
        avatarSpriteNode.zPosition = 1
        
        addChild(leftArrowNode)
        addChild(rightArrowNode)
        addChild(avatarSpriteNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutLeftArrowNode() {
        leftArrowNode.size = leftArrowNode.size.scaleTo(width: size.width * 0.2)
        leftArrowNode.position = .init(x: (-size.width + leftArrowNode.size.width) / 2, y: 0.0)
    }
    
    private func layoutRightArrowNode() {
        rightArrowNode.size = rightArrowNode.size.scaleTo(width: size.width * 0.2)
        rightArrowNode.position = .init(x: (size.width - rightArrowNode.size.width) / 2, y: 0.0)
    }
    
    private func layoutAvatarSpriteNode() {
        avatarSpriteNode.size = size.scaleTo(width: size.width, widthToHeightRatio: 1)
        avatarSpriteNode.position = .zero
    }
}
