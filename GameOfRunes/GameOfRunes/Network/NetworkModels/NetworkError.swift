//
//  NetworkError.swift
//  GameOfRunes
//
//  Created by Andy on 19/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case disconnectError
    case incorrectDatabaseSchema
    
    var localizedDescription: String {
        switch self {
        case .disconnectError:
            return "Internet connection lost!"
        case .incorrectDatabaseSchema:
            return "Database error!"
        }
    }
}
