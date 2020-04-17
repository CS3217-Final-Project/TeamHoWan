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
    private var room: Room = .init() {
        didSet {
            let localPlayer = room.localPlayer
            let remotePlayer = room.remoteplayers.first
            
            // update this to latest
            localPlayerUid = localPlayer?.uid
            
            // refresh frontend
            waitingRoomViewNode.roomId = room.roomId
            waitingRoomViewNode.isHost = room.localPlayerIsHost
            waitingRoomViewNode.isReady = room.isReady
            waitingRoomViewNode.hostSelectedAvatar = room.localPlayerIsHost ? localPlayer?.avatar : remotePlayer?.avatar
            waitingRoomViewNode.playerSelectedAvatar = room.localPlayerIsHost
                ? remotePlayer?.avatar
                : localPlayer?.avatar
            waitingRoomViewNode.hostName = room.localPlayerIsHost ? localPlayer?.name : remotePlayer?.name
            waitingRoomViewNode.playerName = room.localPlayerIsHost ? remotePlayer?.name : localPlayer?.name
        }
    }
    private var localPlayerUid: String?
    
    // Nodes
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
    var navigationStack: [SKNode] = [] {
        didSet {
            refreshBackNode()
        }
    }
    
    var playerName = "" {
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
        waitingRoomViewNode.avatarOverviewNodeResponder = self
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
    
    func transit(from nodeA: SKNode, to nodeB: SKNode) {
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
        alertNode.presentAlert(
            alertDescription: "Do you want to reset all game data?",
            showTick: true,
            showCross: true,
            showLoader: false,
            identifier: "reset",
            status: .warning
        )
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
            joinRoom()
        case .hostRoomButton:
            createRoom()
        case .leaveButton:
            leaveRoom()
        case .playButton:
            startGame()
        case .readyButton:
            toggleReady()
        case .backButton:
            guard let currentViewNode = currentViewNode, let previousViewNode = navigationStack.popLast() else {
                return
            }
            transit(from: currentViewNode, to: previousViewNode)
        case .powerUpIconButton:
            // ignore
            return
        default:
            print("Unknown node tapped: \(tappedNode)")
        }
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

// MARK: - AvatarOverviewNodeResponder
extension GameHomeScene: AvatarOverviewNodeResponder {
    func selectedAvatarDidChanged(newValue: Avatar?) {
        guard let avatar = newValue, let localPlayerUid = room.localPlayer?.uid, let roomId = room.roomId else {
            return
        }
        dbRef.setAvatar(
            uid: localPlayerUid,
            roomId: roomId,
            avatar: avatar.name,
            completion: nil,
            onError: presentErrorAlert
        )
    }
}

// MARK: - Network synchronisation
extension GameHomeScene {
    private func createRoom() {
        alertNode.presentAlert(alertDescription: "Creating a room", showTick: false, showCross: false, showLoader: true)
        
        dbRef.createRoom(
            uid: UUID().uuidString,
            name: playerName,
            completion: createRoomSuccess,
            onError: presentErrorAlert
        )
    }
    
    private func createRoomSuccess(uid: String, roomId: String) {
        alertNode.hideAlert()
        
        localPlayerUid = uid
        
        dbRef.observeRoomState(
            roomId: roomId,
            onDataChange: onDataChange,
            onRoomClose: onRoomClose,
            onError: presentErrorAlert
        )
        
        transit(from: multiplayerActionViewNode, to: waitingRoomViewNode)
    }
    
    private func joinRoom() {
        alertNode.presentAlert(
            alertDescription: "Joining the room",
            showTick: false,
            showCross: false,
            showLoader: true
        )
        
        dbRef.joinRoom(
            uid: UUID().uuidString,
            name: playerName,
            roomId: joinRoomViewNode.inputRoomId,
            completion: joinRoomSuccess,
            onRoomNotOpen: roomNotOpen,
            onRoomNotExist: roomDoesNotExist,
            onError: presentErrorAlert
        )
    }
    
    private func joinRoomSuccess(uid: String) {
        alertNode.hideAlert()
        
        localPlayerUid = uid
        
        dbRef.observeRoomState(
            roomId: joinRoomViewNode.inputRoomId,
            onDataChange: onDataChange,
            onRoomClose: onRoomClose,
            onError: presentErrorAlert
        )
        
        self.transit(from: self.joinRoomViewNode, to: self.waitingRoomViewNode)
        
        // removes multiplayerActionViewNode from stack
        _ = self.navigationStack.popLast()
    }
    
    private func roomNotOpen() {
        alertNode.presentAlert(
            alertDescription: "Room is full",
            showTick: false,
            showCross: true,
            showLoader: false,
            status: .warning
        )
    }
    
    private func roomDoesNotExist() {
        alertNode.presentAlert(
            alertDescription: "Room does not exist",
            showTick: false,
            showCross: true,
            showLoader: false,
            status: .warning
        )
    }
    
    private func leaveRoom() {
        guard let localPlayerUid = room.localPlayer?.uid, let roomId = room.roomId else {
            return
        }
        dbRef.leaveRoom(uid: localPlayerUid, roomId: roomId, completion: leaveRoomSuccess, onError: presentErrorAlert)
    }
    
    private func leaveRoomSuccess() {
        transit(from: waitingRoomViewNode, to: multiplayerActionViewNode)
        
        dbRef.removeObservers()
        
        // reset the room
        room = .init()
    }
    
    private func toggleReady() {
        guard let localPlayerUid = room.localPlayer?.uid, let roomId = room.roomId else {
            return
        }
        dbRef.toggleReadyState(
            uid: localPlayerUid,
            roomId: roomId,
            completion: nil,
            onError: presentErrorAlert
        )
    }
    
    private func onDataChange(roomModel: RoomModel) {
        guard let localPlayerUid = localPlayerUid else {
            return
        }
        room = roomModel.convertToRoom(with: localPlayerUid)
        /*
        let players = roomModel.players
        for player in players {
            // TODO: isReady for front end component to show that player is ready
            if player.isHost {
                waitingRoomViewNode.hostSelectedAvatar = Avatar.getAvatar(withName: player.avatar)
                waitingRoomViewNode.hostName = player.name
            } else {
                waitingRoomViewNode.playerSelectedAvatar = Avatar.getAvatar(withName: player.avatar)
                waitingRoomViewNode.playerName = player.name
            }
        }
        */
    }
    
    private func onRoomClose() {
        alertNode.presentAlert(
            alertDescription: "Room has been closed",
            showTick: false,
            showCross: true,
            showLoader: false,
            status: .warning
        )
        
        transit(from: waitingRoomViewNode, to: multiplayerActionViewNode)
        
        dbRef.removeObservers()
        
        // reset the room
        room = .init()
    }
    
    private func startGame() {
        guard let roomId = room.roomId else {
            return
        }
        dbRef.startGame(
            roomId: roomId,
            completion: startGameSuccess,
            onNotAllReady: notAllReady,
            onError: presentErrorAlert
        )
    }
    
    private func notAllReady() {
        alertNode.presentAlert(
            alertDescription: "Not all players are ready",
            showTick: false,
            showCross: true,
            showLoader: false,
            status: .warning
        )
    }
    
    private func startGameSuccess() {
        gameStateMachine?.enter(GameInMultiplayerPlayState.self)
    }
    
    private func presentErrorAlert(error: Error) {
        alertNode.presentAlert(
            alertDescription: error.localizedDescription,
            showTick: true,
            showCross: false,
            showLoader: false,
            status: .warning
        )
    }
}
