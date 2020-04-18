//
//  LocalRootRenderNode.swift
//  GameOfRunes
//
//  Created by Brian Yen on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/**
 This class is the RootRenderNode for the Local/Main Game for
 Multiplayer Mode. All the UI for the Local/Main Game is established
 in this class.
 - Note: See documentation in the `init()` method for the differences in
 the UI for `RootRenderNode` abd `LocalRootRenderNode`.
 */
class LocalRootRenderNode: RootRenderNode {
    /**
     Note that unlike `RootRenderNode`, `LocalRootRenderNode` has:
     - No Pause Button
     */
    override init(stage: Stage,
                  avatar: Avatar,
                  zPosition: CGFloat,
                  position: CGPoint,
                  size: CGSize) {

        let gameEngine = MultiplayerLocalGameEngine(stage: stage, avatar: avatar, isEndless: true)
        super.init(gameEngine: gameEngine, size: size)
        self.position = position
        self.zPosition = zPosition
        self.isUserInteractionEnabled = true

        // UI
        buildLayers()
        setUpBackground()
        setUpPlayerArea()
        setUpGestureArea()

        // Entities
        setUpEndPoint()
        setUpPlayer()
        setUpTimer(isCountdown: false)

        // Set Up Background Music
        setUpBackgroundMusic()
    }
}
