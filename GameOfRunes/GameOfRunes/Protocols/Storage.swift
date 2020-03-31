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
    
    // automatically overrides existing stage if primary key exists
    func save(stage: Stage)
    
    // optimised for saving multiple stages
    // automatically overrides existing stages if primary key exists
    func save(stages: [Stage]) 
    
    func loadAllStages() -> [Stage]
    
    func loadStages(names: String...) -> [Stage]
    
    func loadStage(name: String) -> Stage?
}
