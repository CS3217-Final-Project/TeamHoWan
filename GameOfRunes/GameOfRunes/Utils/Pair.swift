//
//  Pair.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 10/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

struct Pair<T: Hashable>: Hashable {
    let first: T
    let second: T
    
    init(_ first: T, _ second: T) {
        self.first = first
        self.second = second
    }
    
    func reverse() -> Pair {
        Pair(second, first)
    }
}
