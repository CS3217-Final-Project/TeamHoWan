//
//  GameMapScene.swift
//  GameOfRunes
//
//  Created by Jermy on 27/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class GameMapScene: SKScene {
    private weak var gameStateMachine: GameStateMachine?
    private var previousCameraPosition: CGPoint = .zero
    private var mapSize: CGSize!
    private let backNode: BackNode = .init()
    private var stagePreviewNode: StagePreviewNode!
    private var stageSelectionNode: StageSelectionNode!
    private var selectedStageNode: StageNode? {
        didSet {
            if oldValue == nil, selectedStageNode == nil {
                return
            }
            
            guard let stageNode = selectedStageNode else {
                stagePreviewNode.selectedStage = nil
                stagePreviewNode.run(.fadeOut(withDuration: 0.25))
                return
            }
            
            stagePreviewNode.selectedStage = stageNode.stage
            if stagePreviewNode.alpha.isZero {
                stagePreviewNode.run(.fadeIn(withDuration: 0.25))
            }
        }
    }
    
    // layers
    private var backgroundLayer: SKNode!
    private var stageNodeLayer: SKNode!
    private var cameraLayer: SKNode!
    
    private let bgmNode: SKAudioNode = .init(fileNamed: "His Father's Son")
    
    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        
        anchorPoint = .init(x: 0.5, y: 0.5)
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        buildLayers()
        setUpMap()
        setUpStageNodes()
        setUpCamera()
        setUpBackButton()
        setUpStagePreview()
        setUpStageSelection()
        
        addChild(bgmNode)
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(onPan))
        view.addGestureRecognizer(panGesture)
    }
    
    override func willMove(from view: SKView) {
        super.willMove(from: view)
        
        view.gestureRecognizers?.forEach { view.removeGestureRecognizer($0) }
    }
    
    deinit {
        print("deinit game map scene")
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        guard let touch = touches.first else {
            return
        }
        
        let tapPosition = touch.location(in: self)
        print("Tap position:", tapPosition)
        print("xRatio:", tapPosition.x / (mapSize.width / 2))
        print("yRatio:", tapPosition.y / (mapSize.height / 2))
        print("---------------------------")
        
        selectedStageNode?.selected = false
        selectedStageNode = nil
    }
}

// MARK: - Tap Responder
extension GameMapScene: TapResponder {
    func onTapped(tappedNode: ButtonNode) {
        switch tappedNode.buttonType {
        case .stageNode:
            selectedStageNode?.selected = false
            selectedStageNode = tappedNode as? StageNode
            selectedStageNode?.selected = true
        case .battleButton:
            stageSelectionNode.selectedStage = selectedStageNode?.stage
            stageSelectionNode.selectedAvatar = .elementalWizard
            stageSelectionNode.run(.fadeIn(withDuration: 0.25))
        case .cancelButton:
            stageSelectionNode.run(.fadeOut(withDuration: 0.25))
        case .playButton:
            // Here is the place to load the selected stage and selected avatar
            gameStateMachine?.stage = selectedStageNode?.stage
            gameStateMachine?.avatar = stageSelectionNode.selectedAvatar
            gameStateMachine?.enter(GameStartState.self)
        case .leftButton:
            stageSelectionNode.selectedAvatar = stageSelectionNode.selectedAvatar?.prevAvatar
        case .rightButton:
            stageSelectionNode.selectedAvatar = stageSelectionNode.selectedAvatar?.nextAvatar
        case .powerUpIconButton:
            stageSelectionNode.updatePowerUpDescription()
        case .backButton:
            gameStateMachine?.enter(GameModeSelectionState.self)
        default:
            print("Unknown node tapped:", tappedNode)
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
        let stages = GameViewController.storage.loadAllStages()
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
    
    private func setUpBackButton() {
        backNode.size = backNode.size.scaleTo(width: size.width / 7)
        backNode.position = .init(
            x: -size.width / 2 + backNode.size.width / 1.5,
            y: size.height / 2 - backNode.size.height / 1.5
        )
        backNode.zPosition = -50
        camera?.addChild(backNode)
    }
    
    private func setUpStagePreview() {
        stagePreviewNode = .init(width: size.width)
        stagePreviewNode.position = .init(x: 0.0, y: (size.height - stagePreviewNode.size.height) / 2)
        stagePreviewNode.alpha = .zero
        camera?.addChild(stagePreviewNode)
    }
    
    private func setUpStageSelection() {
        stageSelectionNode = .init(size: size)
        stageSelectionNode.alpha = .zero
        stageSelectionNode.zPosition = 100
        camera?.addChild(stageSelectionNode)
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
}

// MARK: - Updating of Stage Data
extension GameMapScene {
    /**
     This function is called by GameEndState in order to update the front-end
     when the back-end changes (e.g. stage's highscore/achievement level are update)
     */
    func refreshGameMap() {
        // load only the updated stage
        guard let selectedStageNode = selectedStageNode,
            let updatedStage = GameViewController.storage.load(stageName: selectedStageNode.stage.name) else {
                return
        }
        
        // update the struct throughout
        selectedStageNode.stage = updatedStage
        stagePreviewNode.selectedStage = selectedStageNode.stage
        stageSelectionNode.selectedStage = selectedStageNode.stage
    }
}
