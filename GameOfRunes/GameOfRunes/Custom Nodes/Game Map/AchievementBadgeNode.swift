//
//  AchievementBadgeNode.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class AchievementBadgeNode: SKSpriteNode {
    var achievementLevel: Stage.AchievementLevel {
        didSet {
            guard oldValue != achievementLevel else {
                return
            }
            texture = .init(imageNamed: "score-\(achievementLevel)")
        }
    }
    
    init(achievementLevel: Stage.AchievementLevel = .empty) {
        self.achievementLevel = achievementLevel
        let texture = SKTexture(imageNamed: "score-\(achievementLevel)")
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
