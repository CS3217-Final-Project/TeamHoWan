//
//  GameScene.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 `SKScene` for the single player game. The `SKScene` acts as the
 root for all UI nodes.
 - Manages state and scene transitions through `GameStateMachine`.
 Any transitions related to states and scenes should be propagated to
 this class (and in turn `GameStateMachine`) for handling.
 - The immediate children of the `SKScene` should be `RootRenderNode`s,
 which contain the logic used to implement the UI of the game.
 - Game Loop originates in this class' `update()` method
 */
class GameScene: SKScene {
    private var lastUpdateTime: TimeInterval = 0.0
    private lazy var maximumUpdateDeltaTime: TimeInterval = { 1 / .init((view?.preferredFramesPerSecond ?? 60)) }()
    private(set) weak var gameStateMachine: GameStateMachine?
    var rootRenderNode: RootRenderNode!
    private(set) var deltaTime: TimeInterval = 0.0
    private var contactDelegate: ContactDelegate

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        self.contactDelegate = ContactDelegate()
        super.init(size: size)
        physicsWorld.contactDelegate = self.contactDelegate
        
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
        super.sceneDidLoad()
        
        guard let stage = gameStateMachine?.stage,
            let avatar = gameStateMachine?.avatar else {
            fatalError("Unable to load stage or/and avatar from GameStateMachine")
        }

        rootRenderNode = RootRenderNode(
            stage: stage,
            avatar: avatar,
            zPosition: GameConfig.GamePlayScene.rootRenderNodeZPosition,
            position: position,
            size: size
        )

        addChild(rootRenderNode)
    }

    override func update(_ currentTime: TimeInterval) {
        deltaTime = currentTime - lastUpdateTime
        deltaTime = deltaTime > maximumUpdateDeltaTime ? maximumUpdateDeltaTime : deltaTime
        lastUpdateTime = currentTime

        // All updates propagate through the rootRenderNode
        rootRenderNode.update(with: deltaTime)
    }

    /**
     Transitions the game into the `GameEndState`, with a win/lose condition
     and the final score.
     */
    func gameDidEnd(didWin: Bool, finalScore: Int) {
        gameStateMachine?.state(forClass: GameEndState.self)?.didWin = didWin
        gameStateMachine?.state(forClass: GameEndState.self)?.finalScore = finalScore
        gameStateMachine?.enter(GameEndState.self)
    }
}

/**
 Extension to deal with button-related logic (when buttons are tapped).
 Propagates them to `RootRenderNode`.
 */
extension GameScene: TapResponder {
    func onTapped(tappedNode: ButtonNode) {
        switch tappedNode.buttonType {
        case .pauseButton:
            gameStateMachine?.enter(GamePauseState.self)
        case .summonButton:
            rootRenderNode.summonButtonTapped()
        case .powerUpIconButton:
            rootRenderNode.powerUpButtonTapped()
        default:
            print("Unknown node tapped:", tappedNode)
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
