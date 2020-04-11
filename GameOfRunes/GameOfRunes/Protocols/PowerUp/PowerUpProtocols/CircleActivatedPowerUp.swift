//
//  PowerUp+ActivationTypes.swift
//  GameOfRunes
//
//  Created by Andy on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

protocol CircleActivatedPowerUp: PowerUp { }

extension CircleActivatedPowerUp {
    func prepareForActivation(gameEngine: GameEngine) {
        gameEngine.gameScene?.activateGestureDetection()
    }
}
