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
    private let recognizer = DBPathRecognizer(sliceCount: 8, deltaMove: 16.0, costMax: 40)
    private var rawPoints:[Int] = []
    @IBOutlet private var letterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for pathModel in CustomGestures.getAllGesturePathModels() {
            recognizer.addModel(pathModel)
        }

//        if let view = view as? SKView {
//            let sceneManager = SceneManager(presentingView: view)
//
//        }

        let scene = GameEndScene(size: view.bounds.size)
        if let view = view as? SKView {
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }

//        let scene = GameScene(size: view.bounds.size)
//        // Set the scale mode to scale to fit the window
//        scene.scaleMode = .aspectFill
//
//        // Present the scene
//        if let view = view as? SKView {
//            view.presentScene(scene)
//            view.ignoresSiblingOrder = true
//            view.showsFPS = true
//            view.showsNodeCount = true
//        }
    }
    
    // Stores the coordinates of the first touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        rawPoints = []
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: view)
        // TODO: 0.8 is magic number => should be changed 
        if (location.y >= 0.8 * view.bounds.size.height) {
            return
        }
        rawPoints.append(Int(location.x))
        rawPoints.append(Int(location.y))
    }
    
    // Stores all coordinates when the touch moves
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if rawPoints.isEmpty {
            return
        }
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: view)
        if (rawPoints[rawPoints.count-2] != Int(location.x) && rawPoints[rawPoints.count-1] != Int(location.y)) {
            rawPoints.append(Int(location.x))
            rawPoints.append(Int(location.y))
        }
    }
    
    // Create the final path
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        var path: Path = Path()
        path.addPointFromRaw(rawPoints)
        
        guard let gesture: PathModel = self.recognizer.recognizePath(path) else {
            return
        }
        
        guard let customGesture: CustomGestures = gesture.datas as? CustomGestures else {
            return
        }
        print(customGesture.rawValue)
    }
    
    override var shouldAutorotate: Bool {
        true
    }
    
    override var prefersStatusBarHidden: Bool {
        true
    }
}
