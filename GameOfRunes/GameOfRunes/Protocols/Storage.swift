//
//  Storage.swift
//  GameOfRunes
//
//  Created by Jermy on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation

protocol Storage {
    /* add the API methods here */
    var isFirstInit: Bool { get }

    // automatically overrides existing stages if primary key exists
    func save(stages: [Stage])
    // automatically overrides existing stages if primary key exists
    func save(stages: Stage...) 
    
    func loadAllStages() -> [Stage]
    
    func load(stageNames: String...) -> [Stage]
    
    func load(stageNames: [String]) -> [Stage]
    
    func load(stageName: String) -> Stage?
    
    func exists(stageName: String) -> Bool
    
    func delete(stageNames: String...)
    
    func delete(stageNames: [String])

    func didInitialise() 
}
