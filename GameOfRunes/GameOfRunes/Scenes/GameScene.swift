//
//  GameScene.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    private var lastUpdateTime: TimeInterval = 0.0
    private lazy var maximumUpdateDeltaTime: TimeInterval = { 1 / .init((view?.preferredFramesPerSecond ?? 60)) }()
    weak var gameStateMachine: GameStateMachine?
    var center: CGPoint {
        .init(x: frame.midX, y: frame.midY)
    }
    var rootRenderNode: RootRenderNode!
    var deltaTime: TimeInterval = 0.0

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        super.init(size: size)
        
        registerForPauseNotifications()
    }
    
    deinit {
        unregisterNotifications()
        print("deinit game scene")
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {
        guard let stage = gameStateMachine?.stage,
            let avatar = gameStateMachine?.avatar else {
            fatalError("Unable to load stage or/and avatar from GameStateMachine")
        }

        let gameEngine = GameEngine(stage: stage,
                                    avatar: avatar)
        physicsWorld.contactDelegate = gameEngine.contactDelegate
        self.rootRenderNode = RootRenderNode(gameEngine: gameEngine,
                                             zPosition: GameConfig.GamePlayScene.rootRenderNodeZPosition,
                                             position: self.position,
                                             size: size)
        addChild(rootRenderNode)
    }

    override func update(_ currentTime: TimeInterval) {
        deltaTime = currentTime - lastUpdateTime
        deltaTime = deltaTime > maximumUpdateDeltaTime ? maximumUpdateDeltaTime : deltaTime
        lastUpdateTime = currentTime

        // All updates propagate through the rootRenderNode
        rootRenderNode.update(with: deltaTime)
    }

    func gameDidEnd(didWin: Bool, finalScore: Int) {
        gameStateMachine?.state(forClass: GameEndState.self)?.didWin = didWin
        gameStateMachine?.state(forClass: GameEndState.self)?.finalScore = finalScore
        gameStateMachine?.enter(GameEndState.self)
    }
}

/**
 Extension to deal with button-related logic (when buttons are tapped)
 */
extension GameScene: TapResponder {
    func onTapped(tappedNode: ButtonNode) {
        switch tappedNode.buttonType {
        case .pauseButton:
            gameStateMachine?.enter(GamePauseState.self)
        case .summonButton:
            // TODO: Check if this can be re-factored
            rootRenderNode.summonButtonTapped()
        case .powerUpIconButton:
            // TODO: Check if this can be re-factored
            rootRenderNode.powerUpButtonTapped()
        default:
            // TODO: This should be re-factored
            print("Unknown node tapped")
        }
    }
}

/** Pause Game when the application becomes inactive */
extension GameScene {
    private func registerForPauseNotifications() {
        let pauseNotificationName = UIApplication.willResignActiveNotification
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(pauseGame),
            name: pauseNotificationName,
            object: nil
        )
    }
    
    @objc private func pauseGame() {
        gameStateMachine?.enter(GamePauseState.self)
    }
    
    private func unregisterNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
}
