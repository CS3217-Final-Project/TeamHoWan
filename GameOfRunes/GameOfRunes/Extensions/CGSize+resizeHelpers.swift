//
//  CGSize+resizeHelpers.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

extension CGSize {
    // scale to the given height
    // If ratio is nil, the width will be scaled with the current aspect ratio.
    // If ratio is nil and width is zero, the width will take the same value as the height.
    func scaleTo(height: CGFloat, heightToWidthRatio: CGFloat? = nil) -> CGSize {
        guard let ratio = heightToWidthRatio else {
            return .init(width: self.height > 0.0 ? width / self.height * height : height, height: height)
        }
        return .init(width: height / ratio, height: height)
    }
    
    func scaleTo(width: CGFloat, widthToHeightRatio: CGFloat? = nil) -> CGSize {
        guard let ratio = widthToHeightRatio else {
            return .init(width: width, height: self.width > 0.0 ? height / self.width * width : width)
        }
        return .init(width: width, height: width / ratio)
    }
}
