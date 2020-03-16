//
//  GameplayConfiguration.swift
//  GameOfRunes
//
//  Created by Andy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

/** Stores all major game settings. */
// All ratios are relative to the screen width
enum GameplayConfiguration {
    static let fontName = "DragonFire"
    
    enum Enemy {
        static let gestureBubbleOffset = CGPoint(x: 0.0, y: 90.0)
        static let removalAnimationTimePerFrame: TimeInterval = 0.075
    }

    enum Mana {
        static let manaWidth: Double = 75
        static let manaHeight: Double = 75
        static let manaDropProbability: Double = 1.0
        static let manaMinValue: Int = 5
        static let manaMaxValue: Int = 20
    }

    enum SceneManager {
        static let sceneTransitionDuration: TimeInterval = 0.5
    }

    enum GamePauseScene {
        static let buttonWidthRatio: CGFloat = 1 / 8
        static let buttonHeightRatio: CGFloat = 1 / 8
        static let buttomImageName = "continueButton"
    }

    enum GameEndScene {
        static let fontSizeRatio: CGFloat = 1 / 12
        static let buttonWidthRatio: CGFloat = 1 / 8
        static let buttonHeightRatio: CGFloat = 1 / 8
        static let buttonImageName = "restartButton"
    }

    enum GamePlayScene {
        static let buttonWidth: Double = 100
        static let buttonHeight: Double = 100
    }
}
