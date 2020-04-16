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
    
    // Nodes
    private lazy var alertNode: AlertNode = .init(size: size)
    private lazy var nameField: CustomTextField = .init(size: size)
    private lazy var backNode: BackNode = .init()
    private lazy var startViewNode: StartViewNode = .init(size: size)
    private lazy var gameModeSelectionViewNode: GameModeSelectionViewNode = .init(size: size)
    private lazy var multiplayerActionViewNode: MultiplayerActionViewNode = .init(size: size)
    private lazy var joinRoomViewNode: JoinRoomViewNode = .init(size: size)
    private lazy var waitingRoomViewNode: WaitingRoomViewNode = .init(size: size)
    
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
            presentAlert(identifier: "reset",
                         alertNode: alertNode,
                         alertDescription: "Do you want to reset all game data?",
                         showTick: true,
                         showCross: true,
                         showLoader: false,
                         status: .warning)
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
            roomId = ""
        case .joinButton:
            joinRoom()
        case .hostRoomButton:
            playerData.name = playerName
            createRoom()
        case .leaveButton:
            leaveRoom()
        case .playButton:
            toggleReady()
            startGame()
            return
        case .backButton:
            guard let currentViewNode = currentViewNode, let previousViewNode = navigationStack.popLast() else {
                return
            }
            transit(from: currentViewNode, to: previousViewNode)
        case .powerUpIconButton:
            // ignore
            return
        case .readyButton:
            toggleReady()
        default:
            print("Unknown node tapped: \(tappedNode)")
        }
    }
}

// MARK: - AlertResponder
extension GameHomeScene: AlertResponder {
    func crossOnTapped(sender: AlertNode) {
        if sender.identifier == "join" {
            // do sth like terminate the joining?
        } else if sender.identifier == "room_close" {
            // transition back to multiplayer view
        }
        
        sender.isHidden = true
    }
    
    func tickOnTapped(sender: AlertNode) {
        if sender.identifier == "reset" {
            sender.showLoader = true
            GameViewController.storage.reset()
            GameViewController.initStagesInDatabase()
            presentAlert(identifier: "success",
                         alertNode: alertNode,
                         alertDescription: "Game data has been successfully reset",
                         showTick: true,
                         showCross: false,
                         showLoader: false,
                         status: .success)
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

// MARK: - Firebase Methods
extension GameHomeScene {
    private func createRoom() {
        presentAlert(identifier: "create",
                     alertNode: alertNode,
                     alertDescription: "Creating a room...",
                     showTick: false,
                     showCross: false,
                     showLoader: true,
                     status: nil)
        dbRef.createRoom(uid: playerData.uid,
                         name: playerData.name,
                         createRoomSuccess,
                         selfGeneralErrorHandler)
    }
    
    private func createRoomSuccess(roomId: String) {
        alertNode.isHidden = true
        self.roomId = roomId
        dbRef.observeRoomState(forRoomId: roomId,
                               onDataChange,
                               onRoomClose,
                               selfGeneralErrorHandler)
        
        // Set up the waiting room and transition to it
        waitingRoomViewNode.isHost = true
        waitingRoomViewNode.hostName = playerName
        waitingRoomViewNode.roomId = roomId
        transit(from: multiplayerActionViewNode, to: waitingRoomViewNode)
    }
    
    private func joinRoom() {
        presentAlert(identifier: "join",
                     alertNode: alertNode,
                     alertDescription: "Joining the room...",
                     showTick: false,
                     showCross: false,
                     showLoader: true,
                     status: nil)
        dbRef.joinRoom(uid: playerData.uid,
                       name: playerData.name,
                       forRoomId: roomId,
                       joinRoomSuccess,
                       roomNotOpen,
                       roomDoesNotExist,
                       selfGeneralErrorHandler)
    }
    
    private func joinRoomSuccess() {
        dbRef.observeRoomState(forRoomId: roomId,
                               onDataChange,
                               onRoomClose,
                               selfGeneralErrorHandler)
        alertNode.isHidden = true
        
        // Set up the waiting room and transition to it
        self.waitingRoomViewNode.isHost = false
        self.waitingRoomViewNode.playerName = self.playerName
        self.waitingRoomViewNode.roomId = roomId
        self.transit(from: self.joinRoomViewNode, to: self.waitingRoomViewNode)
        
        // removes multiplayerActionViewNode from stack
        _ = self.navigationStack.popLast()
    }
    
    private func roomNotOpen() {
        presentAlert(identifier: "error",
                     alertNode: alertNode,
                     alertDescription: "Room is full!",
                     showTick: true,
                     showCross: false,
                     showLoader: false,
                     status: .warning)
        roomId = ""
    }
    
    private func roomDoesNotExist() {
        presentAlert(identifier: "error",
                     alertNode: alertNode,
                     alertDescription: "Room does not exist!",
                     showTick: true,
                     showCross: false,
                     showLoader: false,
                     status: .warning)
        roomId = ""
    }
    
    private func uponRoomClose() {
        presentAlert(identifier: "room_close",
                     alertNode: alertNode,
                     alertDescription: "Room has been closed!",
                     showTick: true,
                     showCross: false,
                     showLoader: false,
                     status: .warning)
    }
    
    private func leaveRoom() {
        dbRef.leaveRoom(uid: playerData.uid,
                        fromRoomId: roomId,
                        leaveRoomSuccess,
                        selfGeneralErrorHandler)
    }
    
    private func leaveRoomSuccess() {
        transit(from: waitingRoomViewNode, to: multiplayerActionViewNode)
    }
    
    private func toggleReady() {
        dbRef.toggleReadyState(uid: playerData.uid,
                               forRoomId: roomId,
                               readySuccess,
                               selfGeneralErrorHandler)
    }
    
    private func readySuccess() {
        // TODO: Toggle front end ready identifier (some tick?)
    }
    
    func onDataChange(roomModel: RoomModel) {
        let players = roomModel.players
        for player in players {
            // TODO: Check isReady for front end component to show that player is ready
            if player.isHost {
                waitingRoomViewNode.hostSelectedAvatar = Avatar.getAvatar(withName: player.avatar)
                waitingRoomViewNode.hostName = player.name
            } else {
                waitingRoomViewNode.playerSelectedAvatar = Avatar.getAvatar(withName: player.avatar)
                waitingRoomViewNode.playerName = player.name
            }
        }
    }
    
    func onRoomClose() {
        presentAlert(identifier: "error",
                     alertNode: alertNode,
                     alertDescription: "Room has been closed!",
                     showTick: false,
                     showCross: true,
                     showLoader: false,
                     status: .warning)
        transit(from: waitingRoomViewNode, to: multiplayerActionViewNode)
    }
    
    private func startGame() {
        dbRef.startGame(roomId: roomId,
                        notAllReady,
                        startGameSuccess,
                        selfGeneralErrorHandler)
    }
    
    private func notAllReady() {
        presentAlert(identifier: "error",
                     alertNode: alertNode,
                     alertDescription: "Not all players are ready!",
                     showTick: false,
                     showCross: true,
                     showLoader: false,
                     status: .warning)
    }
    
    private func startGameSuccess() {
        // TODO: Transition to multiplayer game scene
    }
    
    private func selfGeneralErrorHandler(error: Error) {
        generalErrorHandler(alertNode: alertNode, error: error)
    }
    
}

extension SKNode {
    func presentAlert(identifier: String,
                      alertNode: AlertNode,
                      alertDescription: String,
                      showTick: Bool,
                      showCross: Bool,
                      showLoader: Bool,
                      status: AlertNode.Status?,
                      disableBackgroundContent: Bool = true,
                      dimBackgroundContent: Bool = true) {
        alertNode.identifier = identifier
        alertNode.alertDescription = alertDescription
        alertNode.showTick = showTick
        alertNode.showCross = showCross
        alertNode.showLoader = showLoader
        alertNode.status = status
        alertNode.isHidden = false
    }
    
    func generalErrorHandler(alertNode: AlertNode, error: Error) {
        presentAlert(identifier: "error",
                     alertNode: alertNode,
                     alertDescription: error.localizedDescription,
                     showTick: true,
                     showCross: false,
                     showLoader: false,
                     status: .warning)
    }
}
