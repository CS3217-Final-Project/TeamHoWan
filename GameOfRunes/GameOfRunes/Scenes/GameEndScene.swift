//
//  GameEndScene.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import ReplayKit

/**
 Scene to be displayed when the game has ended (i.e. either win or lose
 condition has been reached).
 */
class GameEndScene: SKScene, TapResponder {
    // initialise with placeholder value
    var didWin = true
    private weak var gameStateMachine: GameStateMachine?
    private let statusLabel = SKLabelNode(fontNamed: GameConfig.fontName)
    private let viewRecordingButton: ButtonNode
    private var previewVC: RPPreviewViewController? {
        didSet {
            viewRecordingButton.isUserInteractionEnabled = previewVC != nil
            viewRecordingButton.alpha = previewVC != nil ? 1.0 : 0.7
        }
    }

    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        
        viewRecordingButton = ButtonNode(
            size: .init(width: size.width * GameConfig.GameEndScene.buttonWidthRatio,
                        height: size.width * GameConfig.GameEndScene.buttonHeightRatio),
            texture: .init(imageNamed: "recording-button"),
            buttonType: .viewRecordingButton
        )
        super.init(size: size)
        
        anchorPoint = .init(x: 0.5, y: 0.5)
        
        addChild(viewRecordingButton)

        let homeButton = ButtonNode(
            size: .init(width: size.width * GameConfig.GameEndScene.buttonWidthRatio,
                        height: size.width * GameConfig.GameEndScene.buttonHeightRatio),
            texture: .init(imageNamed: "home-button"),
            buttonType: .homeButton
        )
        
        homeButton.position = .init(x: -viewRecordingButton.size.width / 2, y: 0.0)
            + .init(dx: -homeButton.size.width, dy: 0.0)
        addChild(homeButton)
        
        let restartButton = ButtonNode(
            size: .init(width: size.width * GameConfig.GamePauseScene.buttonWidthRatio,
                        height: size.width * GameConfig.GamePauseScene.buttonHeightRatio),
            texture: .init(imageNamed: "restart-button"),
            buttonType: .restartButton
        )
        
        restartButton.position = .init(x: viewRecordingButton.size.width / 2, y: 0.0)
            + .init(dx: restartButton.size.width, dy: 0.0)
        addChild(restartButton)
        
        statusLabel.fontSize = size.width * GameConfig.GameEndScene.fontSizeRatio
        statusLabel.fontColor = .white
        statusLabel.position = .init(x: 0.0, y: homeButton.size.height / 1.5)
        addChild(statusLabel)
    }
    
    deinit {
        print("deinit game end scene")
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        statusLabel.text = didWin ? "You Won!" : "You Lost :("
        
        previewVC = nil

        RPScreenRecorder.shared().stopRecording { [weak self] previewVC, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            print("End recording")
            previewVC?.previewControllerDelegate = self
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                previewVC?.modalPresentationStyle = .popover
                previewVC?.popoverPresentationController?.sourceRect = .zero
                previewVC?.popoverPresentationController?.sourceView = view
                previewVC?.preferredContentSize = (self?.size ?? UIScreen.main.bounds.size)
            }
            
            self?.previewVC = previewVC
        }
    }

    func onTapped(tappedNode: ButtonNode) {
        switch tappedNode.buttonType {
        case .viewRecordingButton:
            guard let previewVC = previewVC else {
                return
            }
            view?.window?.rootViewController?.present(previewVC, animated: true)
        case .homeButton:
            previewVC = nil
            gameStateMachine?.enter(GameStageSelectionState.self)
        case .restartButton:
            previewVC = nil
            gameStateMachine?.enter(GameStartState.self)
        default:
            print("Unknown node tapped:", tappedNode)
        }
    }
}

extension GameEndScene: RPPreviewViewControllerDelegate {
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        previewController.dismiss(animated: true)
        previewVC = nil
    }
}
