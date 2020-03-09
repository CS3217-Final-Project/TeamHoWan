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
    private let recognizer = DBPathRecognizer(sliceCount: 8, deltaMove: 16.0)
    private var rawPoints:[Int] = []
    @IBOutlet private var letterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for pathModel in CustomGestures.getAllGesturePathModels() {
            recognizer.addModel(pathModel)
        }
        
        let scene = GameScene(size: view.bounds.size)
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        // Present the scene
        if let view = view as? SKView {
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    // Stores the coordinates of the first touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        rawPoints = []
        let touch = touches.first
        let location = touch!.location(in: view)
        rawPoints.append(Int(location.x))
        rawPoints.append(Int(location.y))
    }
    
    // Stores all coordinates when the touch moves
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch!.location(in: view)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override var shouldAutorotate: Bool {
        true
    }
    
    override var prefersStatusBarHidden: Bool {
        true
    }
}
