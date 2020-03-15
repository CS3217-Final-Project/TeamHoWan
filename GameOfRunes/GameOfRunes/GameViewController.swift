  
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
    @IBOutlet private var letterLabel: UILabel!
    private var sceneManager: SceneManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = view as? SKView {
            let states = [GameStartState(),
                          GameInPlayState(),
                          GamePauseState(),
                          GameEndState()]
            let gameStateMachine = GameStateMachine(states: states)
            sceneManager = SceneManager(presentingView: view, gameStateMachine: gameStateMachine)
            gameStateMachine.sceneManager = sceneManager
            gameStateMachine.enter(GameStartState.self)
        }
    }
    
    override var shouldAutorotate: Bool {
        true
    }
    
    override var prefersStatusBarHidden: Bool {
        true
    }
  }
