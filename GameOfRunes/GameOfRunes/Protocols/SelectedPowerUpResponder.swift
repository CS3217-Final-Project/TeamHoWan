//
//  SelectedPowerUpResponder.swift
//  GameOfRunes
//
//  Created by Jermy on 29/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

protocol SelectedPowerUpResponder: AnyObject {
    func selectedPowerUpDidChanged(oldValue: PowerUpType?, newSelectedPowerUp: PowerUpType?)
}
