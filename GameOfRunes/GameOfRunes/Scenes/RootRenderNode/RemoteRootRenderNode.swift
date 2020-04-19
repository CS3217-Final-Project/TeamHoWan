//
//  RemoteRootRenderNode.swift
//  GameOfRunes
//
//  Created by Brian Yen on 12/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/**
 This class is the RootRenderNode for the Remote Game/MiniMap for
 Multiplayer Mode. All UI for the MiniMap is established in this class.
 - Note: See documentation in the `init()` method for the differences
 in the UI for `RootRenderNode` and `RemoteRootRenderNode`.
 */
class RemoteRootRenderNode: RootRenderNode {
    /**
     Note that unlike `RootRenderNode`, `RemoteRootRenderNode` has:
     - No Background Music
     - No Pause Button
     - No Player Area
     - No Gesture Area
     */
    init(roomId: String,
         uid: String,
         stage: Stage,
         avatar: Avatar,
         zPosition: CGFloat,
         position: CGPoint,
         size: CGSize) {
        
        super.init(size: size)
        // TODO: pass roomid and uid in
        self.gameEngine = MultiplayerRemoteGameEngine(roomId: roomId,
                                                      uid: uid,
                                                      stage: stage,
                                                      avatar: avatar,
                                                      renderNode: self)
        self.position = position
        self.zPosition = zPosition
        
        // UI
        buildLayers()
        setUpBackground()
        
        // Entities
        setUpEndPoint()
    }
    
    /**
     Hides unnecessary layers in `RootRenderNode`
     */
    override func buildLayers() {
        super.buildLayers()
        gestureLayer.isHidden = true
        manaDropLayer.isHidden = true
    }
    
    /**
     Sets up the EndPoint in the Minimap.
     - Note: `RemoteRootRenderNode` implements its own version of
     this method because there is no `PlayerAreaNode` to take coordinate
     references from (because it is not set up in `RemoteRootRenderNode`).
     */
    override func setUpEndPoint() {
        guard GameConfig.GamePlayScene.numEndPoints > 0 else {
            fatalError("There must be more than 1 lane")
        }
        
        // set up visual end point line
        let endPointNode = SKSpriteNode(imageNamed: "finish-line")
        
        // re-position and resize
        let newEndPointWidth = size.width
        let newEndPointHeight = size.height * GameConfig.GamePlayScene.endPointHeightRatio
        let newEndPointSize = CGSize(width: newEndPointWidth, height: newEndPointHeight)
        endPointNode.size = newEndPointSize
        let originalPlayerAreaWidth = size.width
        let originalPlayerAreaHeight = size.height * GameConfig.GamePlayScene.playerAreaHeightRatio
        let originalPlayerAreaPosition: CGPoint = .init(x: originalPlayerAreaWidth / 2,
                                                        y: originalPlayerAreaHeight / 2)
        endPointNode.position = originalPlayerAreaPosition
            + .init(dx: 0.0, dy: (originalPlayerAreaHeight + newEndPointHeight) / 2)
        
        // relative to the player area layer
        endPointNode.zPosition = -1
        endPointNode.addGlow()
        
        playerEndPoint = endPointNode
        gameEngine.addEndPointEntity(node: endPointNode, team: .player)
        
        // check if need to add enemy end point for elite knight
        guard gameEngine.metadata.avatar == .holyKnight else {
            return
        }
        
        let enemyEndPointNode = SKSpriteNode(color: .clear, size: newEndPointSize)
        let yPosition = (1 - GameConfig.GamePlayScene.verticalOffSetRatio) * size.height
        enemyEndPointNode.position = .init(x: size.width,
                                           y: yPosition)
        gameEngine.addEndPointEntity(node: enemyEndPointNode, team: .enemy)
    }
}
