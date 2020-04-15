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
    private lazy var dbRef: NetworkInterface = FirebaseNetwork()
    private lazy var playerData = PlayerData()
    
    private let alertNode: AlertNode
    private let nameField: CustomTextField
    private let backNode: BackNode = .init()
    private let startViewNode: StartViewNode
    private let gameModeSelectionViewNode: GameModeSelectionViewNode
    private let multiplayerActionViewNode: MultiplayerActionViewNode
    private let joinRoomViewNode: JoinRoomViewNode
    private let hostRoomViewNode: SKNode = .init()
    
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
        }
    }
    private var navigationStack: [SKNode] = [] {
        didSet {
            backNode.isHidden = navigationStack.isEmpty
        }
    }
    
    private var playerName = "" {
        didSet {
            multiplayerActionViewNode.isUserInteractionEnabled = !playerName.isEmpty
        }
    }
    
    private var roomId: String {
        get {
            joinRoomViewNode.inputRoomId
        }
        set {
            joinRoomViewNode.inputRoomId = newValue
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
            playerData.name = playerName
            transit(from: multiplayerActionViewNode, to: joinRoomViewNode)
            navigationStack.append(multiplayerActionViewNode)
            joinRoomViewNode.inputRoomId = ""
        case .joinButton:
<<<<<<< HEAD
            dbRef.joinRoom(uid: playerData.uid,
                           name: playerData.name,
                           forRoomId: joinRoomViewNode.inputRoomId,
                           joinRoomSuccess,
                           roomNotOpen,
                           roomDoesNotExist,
                           generalErrorHandler
            )
=======
            presentJoinAlert()
            // do firebase connection here
            //player name
            //room code => joinRoomViewNode.inputRoomId
>>>>>>> ca8f90b39137c8d0aa45b23401afe26f13671847
        case .backButton:
            guard let currentViewNode = currentViewNode, let previousViewNode = navigationStack.popLast() else {
                return
            }
            transit(from: currentViewNode, to: previousViewNode)
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
        backNode.zPosition = 50
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
        
        alertNode.isHidden = true
        uiLayer.addChild(alertNode)
    }
}

extension GameHomeScene {
    func createRoom() {
        dbRef.createRoom(uid: playerData.uid,
                         name: playerData.name,
                         createRoomSuccess,
                         generalErrorHandler
        )
    }

    func createRoomSuccess(roomId: String) {
        self.roomId = roomId
        // Transit to room view
    }

    func joinRoomSuccess() {
        // Transit to room view.
    }
    
    func roomNotOpen() {
        // Show error alert room not open.
    }
    
    func roomDoesNotExist() {
        // Show error alert room does not exist.
    }
    
    func uponRoomClose() {
        // Transit back to multiplayer view.
    }

    func generalErrorHandler(error: Error) {
        // Show error alert with error message
    }
}
