//
//  GameConfig.swift
//  GameOfRunes
//
//  Created by Andy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

/**
 Stores all major game settings.
 - Note: All ratios are relative to the screen width
 */
enum GameConfig {
    static let fontName = "DragonFire"
    
    enum AnimationNodeKey {
        static let enemy_walking = "enemy-walking-animation"
    }
    
    enum Enemy {
        static let gestureBubbleOffset = CGPoint(x: 0.0, y: 90.0)
        static let removalAnimationTimePerFrame: TimeInterval = 0.075

        // Note: monster difficulties must be unique
        static let nilDifficulty: Int = 0
        static let evilKnightDifficulty: Int = 1
        static let orc1Difficulty: Int = 2
        static let orc2Difficulty: Int = 3
        static let orc3Difficulty: Int = 4
        static let troll1Difficulty: Int = 5
        static let troll2Difficulty: Int = 6
        static let troll3Difficulty: Int = 7
    }

    enum Health {
        static let maxPlayerHealth: Int = 5
    }
    
    enum Mana {
        static let manaWidth: Double = 75
        static let manaHeight: Double = 75
        static let manaDropProbability: Double = 1.0
        static let manaMinValue: Int = 5
        static let manaMaxValue: Int = 20
        static let numManaUnits: Int = 8
        static let manaPerManaUnit: Int = 10
    }

    enum DarkVortexPowerUp {
        static let powerUpDuration: TimeInterval = 8.0
        static let fadeOutDuration: TimeInterval = 0.5
        static let manaUnitCost: Int = 1
    }

    enum HellFirePowerUp {
        static let powerUpDuration: TimeInterval = 8.0
        static let fadeOutDuration: TimeInterval = 0.5
        static let manaUnitCost: Int = 1
    }

    enum IcePrisonPowerUp {
        static let powerUpDuration: TimeInterval = 5.0
        static let fadeOutDuration: TimeInterval = 0.5
        static let manaUnitCost: Int = 1
    }

    enum SceneManager {
        static let sceneTransitionDuration: TimeInterval = 0.5
    }

    enum GamePauseScene {
        static let buttonWidthRatio: CGFloat = 1 / 8
        static let buttonHeightRatio: CGFloat = 1 / 8
    }

    enum GameEndScene {
        static let fontSizeRatio: CGFloat = 1 / 12
        static let buttonWidthRatio: CGFloat = 1 / 8
        static let buttonHeightRatio: CGFloat = 1 / 8
    }

    enum GamePlayScene {
        static let buttonWidthRatio: CGFloat = 1 / 10
        static let buttonHeightRatio: CGFloat = 1 / 10
        static let buttonMargin: CGFloat = 10
        
        // zPositions
        static let backgroundLayerZPosition: CGFloat = -100
        static let enemyLayerZPosition: CGFloat = 0
        static let powerUpAnimationLayerZPosition: CGFloat = 100
        static let removalAnimationLayerZPosition: CGFloat = 200
        static let gestureLayerZPosition: CGFloat = 300
        static let playerAreaLayerZPosition: CGFloat = 400
        static let manaDropLayerZPosition: CGFloat = 500
        static let highestPriorityLayerZPosition: CGFloat = 1_000
        
        // size ratios
        static let playerAreaHeightRatio: CGFloat = 1 / 5
        static let endPointHeightRatio: CGFloat = 1 / 40
        static var gestureAreaHeightRatio: CGFloat {
            1 - playerAreaHeightRatio
        }

        // Spawning of Enemies
        static let numLanes: Int = 3
        static let horizontalOffSet: Double = 100.0
        static let verticalOffSet: Double = 100.0
        static let numEndPoints: Int = 3
    }
}
