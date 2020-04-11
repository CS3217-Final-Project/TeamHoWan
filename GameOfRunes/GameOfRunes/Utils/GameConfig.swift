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
    
    enum Score {
        static let comboTimer: TimeInterval = 2.0
        static let tripleKillScore: Int = 30
        static let pentaKillScore: Int = 50
    }
    
    enum AnimationNodeKey {
        static let enemy_walking = "enemy-walking-animation"
    }
    
    enum Unit {
        static let removalAnimationTimePerFrame: TimeInterval = 0.075
        static let slowMovementSpeed: Float = 75.0
        static let normalMovementSpeed: Float = 100.0
        static let fastMovementSpeed: Float = 150.0
        static let bossMovementSpeed: Float = 25.0
    }
    
    enum Enemy {
        static let runeScalingFactor: CGFloat = 0.4
        static let gestureBubbleOffsetPercentage: CGFloat = 0.95
        static let gestureBubbleOffset = CGPoint(x: 0.0, y: 90.0)
        static let normalScore = 10

        // Note: monster difficulties must be unique
        static let nilDifficulty: Int = 0
        static let orc1Difficulty: Int = 1
        static let orc2Difficulty: Int = 2
        static let orc3Difficulty: Int = 3
        static let troll1Difficulty: Int = 4
        static let troll2Difficulty: Int = 5
        static let troll3Difficulty: Int = 6
        static let evilKnightDifficulty: Int = 7
    }
    
    enum Mana {
        static let manaWidth: CGFloat = 75
        static let manaHeight: CGFloat = 75
        static let manaDropProbability: CGFloat = 1.0
        static let manaMinValue: Int = 5
        static let manaMaxValue: Int = 20
        static let manaPerManaUnit: Int = 10
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
        static let rootRenderNodeZPosition: CGFloat = 0
        static let backgroundLayerZPosition: CGFloat = -100
        static let powerUpAnimationLayerZPosition: CGFloat = 0
        static let unitLayerZPosition: CGFloat = 100
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
        static let horizontalOffSetRatio: CGFloat = 0.1
        static let verticalOffSetRatio: CGFloat = 0.03
        static let numEndPoints: Int = 3
        
        static func calculateHorizontallyDistributedPoints(
            width: CGFloat,
            laneIndex: Int,
            totalPoints: Int,
            yPosition: CGFloat) -> CGPoint {
            
            let xPositionNumerator = 2 * laneIndex + 1
            let xPositionDenominator = 2 * totalPoints
            let xPositionRatio = CGFloat(xPositionNumerator) / CGFloat(xPositionDenominator)
            let edgeOffset = GameConfig.GamePlayScene.horizontalOffSetRatio * width
            let xPosition = (width - 2 * edgeOffset) * xPositionRatio + edgeOffset
            
            return .init(x: xPosition, y: yPosition)
        }
    }
    
    enum GameMapScene {
        static let cameraScale: CGFloat = 0.75
        
        // zPositions
        static let backgroundLayerZPosition: CGFloat = -100
        static let stageNodeLayerZPosition: CGFloat = 0
        static let cameraLayerZPosition: CGFloat = 100
    }

    enum MultiplayerGameScene {
        static let miniMapAlpha: CGFloat = 0.7
        static let miniMapZPosition: CGFloat = 1_500
        static let scalingFactor: CGFloat = 0.3 //Size of Minimap Relative to Screen Size
    }
}
