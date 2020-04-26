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
    init(roomId: String,
         uid: String,
         remotePlayers: [Player],
         stage: Stage,
         avatar: Avatar,
         zPosition: CGFloat,
         position: CGPoint,
         size: CGSize) {
        
        super.init(size: size)
        self.gameEngine = MultiplayerLocalGameEngine(roomId: roomId,
                                                     uid: uid,
                                                     remotePlayers: remotePlayers,
                                                     stage: stage,
                                                     avatar: avatar,
                                                     renderNode: self)
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
    
    override func buildLayers() {
        super.buildLayers()
        gestureLayer.zPosition = GameConfig.MultiplayerGameScene.gestureLayerZPosition
        playerAreaLayer.zPosition = GameConfig.MultiplayerGameScene.playerAreaLayerZPosition
        manaDropLayer.zPosition = GameConfig.MultiplayerGameScene.manaDropLayerZPosition
        highestPriorityLayer.zPosition = GameConfig.MultiplayerGameScene.highestPriorityLayerZPosition
    }
}
