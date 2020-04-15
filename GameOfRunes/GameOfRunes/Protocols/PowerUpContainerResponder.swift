//
//  PowerUpContainerResponder.swift
//  GameOfRunes
//
//  Created by Jermy on 16/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

protocol PowerUpContainerResponder: AnyObject {
    func selectedPowerUpDidChanged(newValue: PowerUpType?)
}
