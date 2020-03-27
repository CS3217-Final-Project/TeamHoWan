//
//  GameMapScene.swift
//  GameOfRunes
//
//  Created by Jermy on 27/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class GameMapScene: SKScene, TapResponder {
    private weak var gameStateMachine: GameStateMachine?
    
    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        
        let texture = SKTexture(imageNamed: "play-button")
        let playButton = ButtonNode(
            size: texture.size(),
            texture: texture,
            buttonType: .playButton,
            position: .init(x: frame.midX, y: frame.midY)
        )
        
        addChild(playButton)
    }
    
    deinit {
        print("deinit game map scene")
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onTapped(tappedNode: ButtonNode) {
        if tappedNode.buttonType == .playButton {
            gameStateMachine?.enter(GameStartState.self)
        }
    }
}
