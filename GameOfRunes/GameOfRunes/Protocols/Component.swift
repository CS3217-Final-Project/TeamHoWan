//
//  Component.swift
//  GameOfRunes
//
//  Created by Dominic Dong on 17/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import GameplayKit

protocol Component: GKComponent {
    var type: ComponentType { get }
}
