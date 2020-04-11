//
//  TapActivatedPowerUp.swift
//  GameOfRunes
//
//  Created by Andy on 11/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

protocol TapActivatedPowerUp: PowerUp { }

extension TapActivatedPowerUp {
    func prepareForActivation(gameEngine: GameEngine) {
        gameEngine.rootRenderNode?.deactivateGestureDetection()
    }
}
