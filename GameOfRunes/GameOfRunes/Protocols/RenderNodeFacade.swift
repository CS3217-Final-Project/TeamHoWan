//
//  GameSceneFacade.swift
//  GameOfRunes
//
//  Created by Andy on 11/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/**
 Methods and properties exposed to the GameEngine
 */
protocol RenderNodeFacade: AnyObject {
    var center: CGPoint { get }
    var size: CGSize { get }
    var playerEndPoint: SKSpriteNode! { get }
    
    func addNodeToLayer(layer: SpriteLayerType, node: SKNode)
    func gameDidEnd(didWin: Bool, finalScore: Int)
    func deactivateGestureDetection()
    func activateGestureDetection()
    func deselectPowerUp()
    func showInsufficientMana(at location: CGPoint)
    func showPowerUpDisabled(at location: CGPoint)
}
