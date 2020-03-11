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
}
