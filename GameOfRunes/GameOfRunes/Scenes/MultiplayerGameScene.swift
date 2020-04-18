//
//  MultiplayerGameScene.swift
//  GameOfRunes
//
//  Created by Brian Yen on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/**
 `SKScene` for the multiplayer game. This game has 2 main games
 running at the same time (the local (main) game, and the remote (mini-map)
 game). Each game is updated by their own respective game engines, which
 in turn will update according to the normal game engine logic and periodically
 sync the game state with the game state obtained via the network (in order
 for multiplayer to function properly).
 - The local (main) game is rooted at `rootRenderNode` and is associated
 with the `MultiplayerLocalGameEngine`
 - The remote (mini-map) game is rooted at `remoteRootRenderNode` and
 is associated with the `MultiplayerRemoteGameEngine`
 */
class MultiplayerGameScene: GameScene {
    var remoteRootRenderNode: RemoteRootRenderNode!

    override func sceneDidLoad() {
        guard let roomData = gameStateMachine?.room,
            let localPlayerAvatar = roomData.localPlayer?.avatar,
            let remotePlayerAvatar = roomData.remoteplayers.first?.avatar else {
            fatalError("Unable to retrieve Room Data")
        }

        // Local Game
        rootRenderNode = LocalRootRenderNode(
            stage: EnemyWaveCreator.endlessSeedStage,
            avatar: localPlayerAvatar,
            zPosition: GameConfig.GamePlayScene.rootRenderNodeZPosition,
            position: position,
            size: size
        )
        
        addChild(rootRenderNode)

        // Remote Game (MiniMap)
        let remoteRootWidth = size.width * GameConfig.MultiplayerGameScene.scalingFactor
        let remoteRootHeight = size.height * GameConfig.MultiplayerGameScene.scalingFactor
        let remoteRootPosition = CGPoint(x: size.width - remoteRootWidth, y: size.height - remoteRootHeight)
        
        remoteRootRenderNode = RemoteRootRenderNode(
            stage: EnemyWaveCreator.emptySeedStage,
            avatar: remotePlayerAvatar,
            zPosition: GameConfig.MultiplayerGameScene.miniMapZPosition,
            position: remoteRootPosition,
            size: CGSize(width: remoteRootWidth, height: remoteRootHeight)
        )
        remoteRootRenderNode.alpha = GameConfig.MultiplayerGameScene.miniMapAlpha
        
        addChild(remoteRootRenderNode)
    }

    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        self.remoteRootRenderNode.update(with: deltaTime)
    }
}
