//
//  HomeViewController.swift
//  GameOfRunes
//
//  Created by Jermy on 25/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpHomeBackground()
    }
    
    private func setUpHomeBackground() {
        let background = UIImageView(image: UIImage(named: "relic-guardian"))
        background.clipsToBounds = true
        background.contentMode = .scaleAspectFill
        
        view.addSubview(background)
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
