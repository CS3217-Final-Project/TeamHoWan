//
//  JoinGameViewController.swift
//  GameOfRunes
//
//  Created by Andy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

class JoinGameViewController: UIViewController {
    private var dbRef: NetworkInterface
    private var codeInputVC = CodeInputViewController()

    init(dbRef: NetworkInterface) {
        self.dbRef = dbRef
        super.init(nibName: nil, bundle: nil)
        
        setUpHomeBackground()
        addChild(codeInputVC)
        view.addSubview(codeInputVC.view)
        view.bringSubviewToFront(codeInputVC.view)
    }
    
    private func setUpHomeBackground() {
        let background = UIImageView(image: UIImage(named: "relic-guardian"))
        background.contentMode = .scaleAspectFill
        
        view.addSubview(background)
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview().labeled("backgroundEdges")
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIViewController {
    func openJoinGameView(db: NetworkInterface) {
        let joinGameViewController = JoinGameViewController(dbRef: db)
        joinGameViewController.modalPresentationStyle = .fullScreen
        joinGameViewController.modalTransitionStyle = .crossDissolve
        present(joinGameViewController, animated: true, completion: nil)
    }
}
