//
//  TeamComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit
import GameplayKit

class TeamComponent: GKComponent, Component {
    let team: Team
    
    init(team: Team) {
        self.team = team
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getType() -> ComponentType {
        return .teamComponent
    }
}
