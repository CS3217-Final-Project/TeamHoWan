//
//  AlertResponder.swift
//  GameOfRunes
//
//  Created by Jermy on 15/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

protocol AlertResponder: AnyObject {
    func crossOnTapped(sender: AlertNode)
    
    func tickOnTapped(sender: AlertNode)
}

extension AlertResponder {
    func crossOnTapped(sender: AlertNode) {
        // empty implementation to make this method optional
    }
    
    func tickOnTapped(sender: AlertNode) {
        // empty implementation to make this method optional
    }
}
