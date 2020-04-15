//
//  NumberPadResponder.swift
//  GameOfRunes
//
//  Created by Jermy on 15/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

protocol NumberPadResponder: AnyObject {
    func displayedValueDidChanged(newValue: String)
}
