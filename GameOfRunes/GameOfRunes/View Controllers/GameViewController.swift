//
  //  GameViewController.swift
  //  GameOfRunes
  //
  //  Created by Jermy on 8/3/20.
  //  Copyright © 2020 TeamHoWan. All rights reserved.
  //

  import UIKit
  import SpriteKit
  import GameplayKit
  
  class GameViewController: UIViewController {
    private var sceneManager: SceneManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = view as? SKView {
            let gameStateMachine = GameStateMachine(
                states: [GameInPlayState(),
                         GameStartState(),
                         GamePauseState(),
                         GameEndState(),
                         GameSelectionState()]
            )
            
            sceneManager = .init(presentingView: view, gameStateMachine: gameStateMachine)
            gameStateMachine.sceneManager = sceneManager
            gameStateMachine.enter(GameSelectionState.self)
        }
    }
    
    override var shouldAutorotate: Bool {
        true
    }
    
    override var prefersStatusBarHidden: Bool {
        true
    }
  }
