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
    private var previousCameraPosition: CGPoint = .zero
    private var mapSize: CGSize!
    
    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        
        anchorPoint = .init(x: 0.5, y: 0.5)
        setUpScene()
    }
    
    override func didMove(to view: SKView) {
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(onPan))
        view.addGestureRecognizer(panGesture)
    }
    
    override func willMove(from view: SKView) {
        view.gestureRecognizers?.forEach { view.removeGestureRecognizer($0) }
    }
    
    @objc private func onPan(_ sender: UIPanGestureRecognizer) {
        guard let camera = camera else {
            return
        }
        
        if sender.state == .began {
            previousCameraPosition = camera.position
        }
        
        let translation = sender.translation(in: view)
        camera.position = .init(
            x: previousCameraPosition.x + translation.x * -1,
            y: previousCameraPosition.y + translation.y
        )
    }
    
    private func setUpScene() {
        // add map
        let mapTexture = SKTexture(imageNamed: "game-map")
        mapSize = mapTexture.size()
        let mapNode = SKSpriteNode(
            texture: mapTexture,
            color: .clear,
            size: mapSize
        )
        
        mapNode.zPosition = -1
        addChild(mapNode)
        
        // add camera node
        let camera = SKCameraNode()
        camera.setScale(0.75)
        
        let viewWidth = size.width * camera.xScale
        let mapWidth = mapSize.width
        let viewHeight = size.height * camera.yScale
        let mapHeight = mapSize.height
        let xRange = SKRange(lowerLimit: (-mapWidth + viewWidth) / 2, upperLimit: (mapWidth - viewWidth) / 2)
        let yRange = SKRange(lowerLimit: (-mapHeight + viewHeight) / 2, upperLimit: (mapHeight - viewHeight) / 2)
        
        camera.constraints = [.positionX(xRange, y: yRange)]
        
        self.camera = camera
        addChild(camera)
        
        // add play button
        let texture = SKTexture(imageNamed: "play-button")
        let playButton = ButtonNode(
            size: texture.size(),
            texture: texture,
            buttonType: .playButton
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
