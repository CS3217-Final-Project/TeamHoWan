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
    
    // layers
    private var backgroundLayer: SKNode!
    private var stageNodeLayer: SKNode!
    private var cameraLayer: SKNode!
    
    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        
        anchorPoint = .init(x: 0.5, y: 0.5)
    }
    
    override func sceneDidLoad() {
        buildLayers()
        setUpMap()
        setUpStageNodes()
        setUpCamera()
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(onPan))
        view.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(onTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func willMove(from view: SKView) {
        super.willMove(from: view)
        
        view.gestureRecognizers?.forEach { view.removeGestureRecognizer($0) }
    }
    
    private func setUpScene() {
        
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

// MARK: - Scene setup
extension GameMapScene {
    private func buildLayers() {
        backgroundLayer = .init()
        backgroundLayer.zPosition = GameConfig.GameMapScene.backgroundLayerZPosition
        addChild(backgroundLayer)
        
        stageNodeLayer = .init()
        stageNodeLayer.zPosition = GameConfig.GameMapScene.stageNodeLayerZPosition
        addChild(stageNodeLayer)
        
        cameraLayer = .init()
        cameraLayer.zPosition = GameConfig.GameMapScene.cameraLayerZPosition
        addChild(cameraLayer)
    }
    
    private func setUpMap() {
        let mapTexture = SKTexture(imageNamed: "game-map")
        mapSize = mapTexture.size()
        let mapNode = SKSpriteNode(
            texture: mapTexture,
            color: .clear,
            size: mapSize
        )
        
        backgroundLayer.addChild(mapNode)
    }
    
    private func setUpStageNodes() {
        // TODO: change to access from storage when persistence is implemented
        let stage1 = Stage(
            name: "The Beginning",
            id: "1-1",
            category: .normal,
            relativePositionRatioInMap: (x: 0.6, y: -0.55),
            arena: .arena1,
            difficulty: 100,
            numWaves: 7
        )
        
        let stage2 = Stage(
            name: "Warrior's Arena",
            id: "1-2",
            category: .normal,
            relativePositionRatioInMap: (x: 0.17, y: -0.43),
            arena: .arena1,
            difficulty: 100,
            numWaves: 7
        )
        
        let stage3 = Stage(
            name: "The crossing",
            id: "1-3",
            category: .normal,
            relativePositionRatioInMap: (x: 0.25, y: -0.22),
            arena: .arena1,
            difficulty: 100,
            numWaves: 7
        )
        
        let stage4 = Stage(
            name: "The first boss",
            id: "1-4",
            category: .boss,
            relativePositionRatioInMap: (x: 0.09, y: 0.05),
            arena: .arena1,
            difficulty: 100,
            numWaves: 7
        )
        
        let stages = [stage1, stage2, stage3, stage4]
        let stageNodes = stages.map { StageNode(stage: $0, mapSize: mapSize) }
        stageNodes.forEach { stageNodeLayer.addChild($0) }
        
        // make camera start at first stage
        previousCameraPosition = stageNodes[0].position
    }
    
    private func setUpCamera() {
        let camera = SKCameraNode()
        camera.setScale(GameConfig.GameMapScene.cameraScale)
        camera.position = previousCameraPosition
        self.camera = camera
        
        // ensures camera does not go out of map boundary
        let viewWidth = size.width * camera.xScale
        let mapWidth = mapSize.width
        let viewHeight = size.height * camera.yScale
        let mapHeight = mapSize.height
        let xRange = SKRange(lowerLimit: (-mapWidth + viewWidth) / 2, upperLimit: (mapWidth - viewWidth) / 2)
        let yRange = SKRange(lowerLimit: (-mapHeight + viewHeight) / 2, upperLimit: (mapHeight - viewHeight) / 2)
        camera.constraints = [.positionX(xRange, y: yRange)]
        
        cameraLayer.addChild(camera)
    }
}

// MARK: - Gesture logic
extension GameMapScene {
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
    
    @objc private func onTap(_ sender: UITapGestureRecognizer) {
        let tapPosition = convertPoint(fromView: sender.location(in: view))
        print("Tap position:", tapPosition)
        print("xRatio:", tapPosition.x / (mapSize.width / 2))
        print("yRatio:", tapPosition.y / (mapSize.height / 2))
        print("---------------------------")
    }
}
