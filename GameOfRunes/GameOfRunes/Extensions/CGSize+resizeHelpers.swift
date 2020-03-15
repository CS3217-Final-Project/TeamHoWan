//
//  CGSize+resizeHelpers.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

extension CGSize {
    func scaleTo(height: CGFloat) -> CGSize {
        .init(width: self.height > 0.0 ? width / self.height * height : height, height: height)
    }
    
    func scaleTo(width: CGFloat) -> CGSize {
        .init(width: width, height: self.width > 0.0 ? height / self.width * width : width)
    }
}
