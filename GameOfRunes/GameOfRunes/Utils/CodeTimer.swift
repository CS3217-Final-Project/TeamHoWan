//
//  CodeTimer.swift
//  GameOfRunes
//
//  Created by Brian Yen on 2/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Dispatch
import Foundation

class CodeTimer {
    private var startTime: DispatchTime

    init() {
        startTime = DispatchTime.now()
    }

    func stop() -> TimeInterval {
        let endTime = DispatchTime.now()
        let durationNanoSeconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let durationTimeInterval = Double(durationNanoSeconds) / 1_000_000_000
        return durationTimeInterval
    }

    func reset() {
        startTime = DispatchTime.now()
    }
}
