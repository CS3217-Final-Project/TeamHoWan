//
//  MultiplayerGameScene.swift
//  GameOfRunes
//
//  Created by Brian Yen on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class MultiplayerGameScene: GameScene {
    var remoteRootRenderNode: RootRenderNode!
    override init(size: CGSize, gameStateMachine: GameStateMachine) {
        super.init(size: size, gameStateMachine: gameStateMachine)
    }

    override func sceneDidLoad() {
        guard let stage = gameStateMachine?.stage,
            let avatar = gameStateMachine?.avatar else {
            fatalError("Unable to load stage or/and avatar from GameStateMachine")
        }

        // TODO: Use MultiplayerGameEngineLocal later
        let gameEngine = GameEngine(stage: stage,
                                    avatar: avatar)
        physicsWorld.contactDelegate = gameEngine.contactDelegate
        self.rootRenderNode = RootRenderNode(gameEngine: gameEngine,
                                             zPosition: GameConfig.GamePlayScene.rootRenderNodeZPosition,
                                             position: self.position,
                                             size: size)
        addChild(rootRenderNode)

        // TODO: Use MultiplayerGameEngineRemote later
        let remoteGameEngine = GameEngine(stage: stage,
                                          avatar: avatar)
        let remoteRootWidth = size.width * GameConfig.MultiplayerGameScene.scalingFactor
        let remoteRootHeight = size.height * GameConfig.MultiplayerGameScene.scalingFactor
        let remoteRootPosition = CGPoint(x: size.width - remoteRootWidth,
                                         y: size.height - remoteRootHeight)
        self.remoteRootRenderNode = RootRenderNode(gameEngine: remoteGameEngine,
                                                   zPosition: GameConfig.MultiplayerGameScene.miniMapZPosition,
                                                   position: remoteRootPosition,
                                                   size: CGSize(width: remoteRootWidth,
                                                                height: remoteRootHeight))
        self.remoteRootRenderNode.alpha = GameConfig.MultiplayerGameScene.miniMapAlpha
        addChild(remoteRootRenderNode)
    }

    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        self.remoteRootRenderNode.update(with: self.deltaTime)
    }
}
