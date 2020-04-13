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
    private let nameField: CustomTextField
    private let backNode: BackNode = .init()
    private let startViewNode: StartViewNode
    private let gameModeSelectionViewNode: GameModeSelectionViewNode
    private let multiplayerActionViewNode: MultiplayerActionViewNode
    private let joinRoomViewNode: JoinRoomViewNode
    private let hostRoomViewNode: SKNode = .init()
    private weak var currentViewNode: SKNode? {
        didSet {
            if currentViewNode is MultiplayerActionViewNode {
                nameField.isHidden = false
            } else {
                nameField.isHidden = true
                nameField.resignFirstResponder()
            }
        }
    }
    private var navigationStack: [SKNode] = [] {
        didSet {
            backNode.isHidden = navigationStack.isEmpty
        }
    }
    
    private var inputName = "" {
        didSet {
            multiplayerActionViewNode.isUserInteractionEnabled = !inputName.isEmpty
        }
    }
    
    // layers
    private let backgroundLayer: SKNode = .init()
    private let uiLayer: SKNode = .init()
    
    private let bgmNode: SKAudioNode = .init(fileNamed: "Destiny-Ablaze")
    
    init(size: CGSize, gameStateMachine: GameStateMachine) {
        self.gameStateMachine = gameStateMachine
        
        nameField = .init(size: size)
        startViewNode = .init(size: size)
        gameModeSelectionViewNode = .init(size: size)
        multiplayerActionViewNode = .init(size: size)
        joinRoomViewNode = .init(size: size)
        
        super.init(size: size)
        
        anchorPoint = .init(x: 0.5, y: 0.5)
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
    }
}

extension GameHomeScene: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if string.isEmpty {
            return true
        } else if (textField.text ?? "").count > 12 {
            return false
        } else {
            let invalidChars = CharacterSet(charactersIn: ";,.-+=*/")
            return string.removingCharacters(in: invalidChars) == string
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        inputName = textField.text ?? ""
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
        case .startButton:
            transit(from: startViewNode, to: gameModeSelectionViewNode)
            navigationStack.append(startViewNode)
            currentViewNode = gameModeSelectionViewNode
        case .singlePlayerButton:
            gameStateMachine?.enter(GameStageSelectionState.self)
        case .multiplayerButton:
            transit(from: gameModeSelectionViewNode, to: multiplayerActionViewNode)
            navigationStack.append(gameModeSelectionViewNode)
            currentViewNode = multiplayerActionViewNode
        case .joinRoomButton:
            transit(from: multiplayerActionViewNode, to: joinRoomViewNode)
            navigationStack.append(multiplayerActionViewNode)
            currentViewNode = joinRoomViewNode
            joinRoomViewNode.numberPadNode.displayValue = ""
        case .joinButton:
            // do firebase connection here
            return
        case .backButton:
            guard let currentViewNode = currentViewNode, let previousViewNode = navigationStack.popLast() else {
                return
            }
            transit(from: currentViewNode, to: previousViewNode)
            self.currentViewNode = previousViewNode
        default:
            print("Unknown node tapped:", tappedNode)
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
        uiLayer.addChild(backNode)
    }
    
    private func setUpNameField() {
        nameField.isHidden = true
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
    }
}
