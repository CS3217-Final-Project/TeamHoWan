//
//  FirebaseObserver.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Firebase

struct FirebaseObserver {
    var handle: DatabaseHandle
    var reference: DatabaseReference
    
    init(withHandle handle: DatabaseHandle, withRef reference: DatabaseReference) {
        self.handle = handle
        self.reference = reference
    }
}
