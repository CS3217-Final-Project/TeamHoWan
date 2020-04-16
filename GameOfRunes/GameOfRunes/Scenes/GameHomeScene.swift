//
//  GameHomeScene.swift
//  GameOfRunes
//
//  Created by Jermy on 12/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class GameHomeScene: SKScene {
    private weak var gameStateMachine: GameStateMachine?
    private let alertNode: AlertNode
    private let nameField: CustomTextField
    private let backNode: BackNode = .init()
    private let startViewNode: StartViewNode
    private let gameModeSelectionViewNode: GameModeSelectionViewNode
    private let multiplayerActionViewNode: MultiplayerActionViewNode
    private let joinRoomViewNode: JoinRoomViewNode
    private let waitingRoomViewNode: WaitingRoomViewNode
    private weak var currentViewNode: SKNode? {
        didSet {
            guard oldValue != currentViewNode else {
                return
            }
            
            if currentViewNode is MultiplayerActionViewNode {
                UIView.animate(withDuration: 0.25, delay: 0.25, options: .curveLinear, animations: {
                    self.nameField.alpha = 1
                })
            } else if nameField.alpha != .zero {
                UIView.animate(withDuration: 0.25) {
                    self.nameField.alpha = .zero
                }
                nameField.resignFirstResponder()
            }
            
            refreshBackNode()
        }
    }
    private var navigationStack: [SKNode] = [] {
        didSet {
            refreshBackNode()
        }
    }
    
    private var playerName = "" {
        didSet {
            multiplayerActionViewNode.isUserInteractionEnabled = !playerName.isEmpty
        }
    }
    
    // layers
    private let backgroundLayer: SKNode = .init()
    private let uiLayer: SKNode = .init()
    
    private let bgmNode: SKAudioNode = .init(fileNamed: "Destiny-Ablaze")
    
    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        
        alertNode = .init(size: size)
        nameField = .init(size: size)
        startViewNode = .init(size: size)
        gameModeSelectionViewNode = .init(size: size)
        multiplayerActionViewNode = .init(size: size)
        joinRoomViewNode = .init(size: size)
        waitingRoomViewNode = .init(size: size)
        
        super.init(size: size)
        
        anchorPoint = .init(x: 0.5, y: 0.5)
        alertNode.responder = self
    }
    
    deinit {
        print("deinit game home scene")
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        buildLayers()
        setUpBackground()
        setUpBackButton()
        setUpNameField()
        setUpViews()
        
        addChild(bgmNode)
    }
    
    override func didMove(to view: SKView) {
        let nodeSize = multiplayerActionViewNode.calculateAccumulatedFrame().size
        nameField.center = convertPoint(
            toView: multiplayerActionViewNode.position + .init(dx: 0.0, dy: nodeSize.height)
        )
        
        view.addSubview(nameField)
    }
    
    override func willMove(from view: SKView) {
        nameField.removeFromSuperview()
    }
    
    private func refreshBackNode() {
        backNode.isHidden = navigationStack.isEmpty || currentViewNode is WaitingRoomViewNode
    }
    
    private func transit(from nodeA: SKNode, to nodeB: SKNode) {
        let currentState = nodeA.isUserInteractionEnabled
        // ensures this node doesn't get tapped multiple times while fading out
        nodeA.isUserInteractionEnabled = false
        // ensures back button doesn't get tapped multiple times while fading out
        backNode.isUserInteractionEnabled = false
        
        nodeA.run(.fadeOut(withDuration: 0.25)) {
            // sets nodeA back to original state
            nodeA.isUserInteractionEnabled = currentState
            
            let currentState = nodeB.isUserInteractionEnabled
            // ensures this node doesn't get tapped multiple times while fading in
            nodeB.isUserInteractionEnabled = false
            
            nodeB.run(.fadeIn(withDuration: 0.25)) {
                // sets nodeB back to original state
                nodeB.isUserInteractionEnabled = currentState
                // activates back button
                self.backNode.isUserInteractionEnabled = true
            }
        }
        
        // update current view node
        currentViewNode = nodeB
    }
    
    private func presentResetDataAlert() {
        alertNode.identifier = "reset"
        alertNode.alertDescription = "Do you want to reset all game data?"
        alertNode.disableBackgroundContent = true
        alertNode.dimBackgroundContent = true
        alertNode.showTick = true
        alertNode.showCross = true
        alertNode.showLoader = false
        alertNode.status = .warning
        alertNode.isHidden = false
    }
    
    private func presentSuccessAlert(message: String) {
        alertNode.identifier = "success"
        alertNode.alertDescription = message
        alertNode.disableBackgroundContent = true
        alertNode.dimBackgroundContent = true
        alertNode.showTick = true
        alertNode.showCross = false
        alertNode.showLoader = false
        alertNode.status = .success
        alertNode.isHidden = false
    }
    
    private func presentJoinAlert() {
        alertNode.identifier = "join"
        alertNode.alertDescription = "Establishing connection to room..."
        alertNode.disableBackgroundContent = true
        alertNode.dimBackgroundContent = true
        alertNode.showTick = false
        alertNode.showCross = true
        alertNode.showLoader = true
        alertNode.status = nil
        alertNode.isHidden = false
    }
}

extension GameHomeScene: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if string.isEmpty || string == " " {
            return true
        } else if (textField.text ?? "").count > 12 {
            return false
        } else {
            // ensures all characters are alphanumerics
            return string.removingCharacters(in: .alphanumerics).isEmpty
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let processedText = (textField.text ?? "")
            .replacingOccurrences(of: "^\\s+", with: "", options: .regularExpression)
        playerName = processedText.trimmingCharacters(in: .whitespacesAndNewlines)
        textField.text = processedText
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Tap Responder
extension GameHomeScene: TapResponder {
    func onTapped(tappedNode: ButtonNode) {
        switch tappedNode.buttonType {
        case .settingsButton:
            presentResetDataAlert()
        case .startButton:
            transit(from: startViewNode, to: gameModeSelectionViewNode)
            navigationStack.append(startViewNode)
        case .singlePlayerButton:
            gameStateMachine?.enter(GameStageSelectionState.self)
        case .multiplayerButton:
            transit(from: gameModeSelectionViewNode, to: multiplayerActionViewNode)
            navigationStack.append(gameModeSelectionViewNode)
        case .joinRoomButton:
            transit(from: multiplayerActionViewNode, to: joinRoomViewNode)
            navigationStack.append(multiplayerActionViewNode)
            joinRoomViewNode.inputRoomId = ""
        case .joinButton:
            presentJoinAlert()
            // do firebase connection here
            
            // mimics the firebase connection time
            // frontend placeholder
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
                self.alertNode.isHidden = true
                // success
                self.waitingRoomViewNode.isHost = false
                self.waitingRoomViewNode.isReady = false
                self.waitingRoomViewNode.playerName = self.playerName
                self.waitingRoomViewNode.roomId = self.joinRoomViewNode.inputRoomId
                self.transit(from: self.joinRoomViewNode, to: self.waitingRoomViewNode)
                // removes multiplayerActionViewNode from stack
                _ = self.navigationStack.popLast()
            }
        case .hostRoomButton:
            // do firebase connection here
            
            // frontend placeholder
            waitingRoomViewNode.isHost = true
            waitingRoomViewNode.isReady = false
            waitingRoomViewNode.hostName = playerName
            waitingRoomViewNode.roomId = .init(format: "%05d", Int.random(in: 0 ..< 100_000))
            transit(from: multiplayerActionViewNode, to: waitingRoomViewNode)
        case .leaveButton:
            // do firebase connection here
            transit(from: waitingRoomViewNode, to: multiplayerActionViewNode)
        case .playButton:
            // check if other player is ready
            // transit to multiplayer game scene
            return
        case .readyButton:
            // do firebase connection here
            // swiftlint:disable:toggle_bool
            waitingRoomViewNode.isReady = !waitingRoomViewNode.isReady
        case .backButton:
            guard let currentViewNode = currentViewNode, let previousViewNode = navigationStack.popLast() else {
                return
            }
            transit(from: currentViewNode, to: previousViewNode)
        case .powerUpIconButton:
            // ignore
            return
        default:
            print("Unknown node tapped:", tappedNode)
        }
    }
}

// MARK: - AlertResponder
extension GameHomeScene: AlertResponder {
    func crossOnTapped(sender: AlertNode) {
        if sender.identifier == "join" {
            // do sth like terminate the joining?
        }
        
        sender.isHidden = true
    }
    
    func tickOnTapped(sender: AlertNode) {
        if sender.identifier == "reset" {
            sender.showLoader = true
            GameViewController.storage.reset()
            GameViewController.initStagesInDatabase()
            presentSuccessAlert(message: "Game data has been successfully reset")
            return
        }
        
        sender.isHidden = true
    }
}

// MARK: - Scene setup
extension GameHomeScene {
    private func buildLayers() {
        backgroundLayer.zPosition = GameConfig.GameHomeScene.backgroundLayerZPosition
        addChild(backgroundLayer)
        
        uiLayer.zPosition = GameConfig.GameHomeScene.uiLayerZPosition
        addChild(uiLayer)
    }
    
    private func setUpBackground() {
        let backgroundNode = SKSpriteNode(
            texture: .init(imageNamed: "relic-guardian"),
            color: .clear,
            size: size
        )
        
        backgroundNode.aspectFillToSize(fillSize: size)
        backgroundLayer.addChild(backgroundNode)
    }
    
    private func setUpBackButton() {
        backNode.size = backNode.size.scaleTo(width: size.width / 7)
        backNode.position = .init(
            x: -size.width / 2 + backNode.size.width / 1.5,
            y: size.height / 2 - backNode.size.height / 1.5
        )
        backNode.isHidden = true
        backNode.zPosition = 100
        uiLayer.addChild(backNode)
    }
    
    private func setUpNameField() {
        nameField.alpha = .zero
        nameField.background = UIImage(named: "name-label")
        nameField.textAlignment = .center
        nameField.font = UIFont(name: GameConfig.fontName, size: nameField.frame.size.height / 5)
        nameField.placeholder = "Enter a name"
        nameField.delegate = self
        nameField.textColor = .black
    }
    
    private func setUpViews() {
        uiLayer.addChild(startViewNode)
        
        gameModeSelectionViewNode.alpha = .zero
        uiLayer.addChild(gameModeSelectionViewNode)
        
        multiplayerActionViewNode.alpha = .zero
        multiplayerActionViewNode.isUserInteractionEnabled = false
        uiLayer.addChild(multiplayerActionViewNode)
        
        joinRoomViewNode.alpha = .zero
        uiLayer.addChild(joinRoomViewNode)
        
        waitingRoomViewNode.alpha = .zero
        uiLayer.addChild(waitingRoomViewNode)
        
        alertNode.isHidden = true
        uiLayer.addChild(alertNode)
    }
}
