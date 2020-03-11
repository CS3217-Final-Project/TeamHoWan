//
//  GameplayConfiguration.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation
import CoreGraphics

struct GameplayConfiguration {
    struct Enemy {
        static let gestureBubbleOffset = CGPoint(x: 0.0, y: 65.0)
    }

    struct SceneManager {
        static let sceneTransitionDuration: TimeInterval = 0.5
    }

    struct GamePauseScene {
        static let buttonWidth: Double = 100
        static let buttonHeight: Double = 100
    }

    struct GameEndScene {
        static let buttonWidth: Double = 100
        static let buttonHeight: Double = 100
        static let contentSpacing: Double = 20
    }

    struct GamePlayScene {
        static let buttonWidth: Double = 100
        static let buttonHeight: Double = 100
    }
}
