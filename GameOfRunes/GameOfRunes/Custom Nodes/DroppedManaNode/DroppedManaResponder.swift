//
//  DroppedManaResponder.swift
//  GameOfRunes
//
//  Created by Brian Yen on 15/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

/**
 Protocol implemented by the responder to `DroppedManaNode`
 whenever the node is tapped on.
 */
protocol DroppedManaResponder: AnyObject {
    func droppedManaTapped(droppedManaNode: DroppedManaNode)
}

