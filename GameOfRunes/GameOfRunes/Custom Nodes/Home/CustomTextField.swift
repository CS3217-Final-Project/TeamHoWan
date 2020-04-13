//
//  CustomTextField.swift
//  GameOfRunes
//
//  Created by Jermy on 13/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    init(size: CGSize) {
        super.init(
            frame: .init(origin: .zero, size: size.scaleTo(width: size.width / 2, widthToHeightRatio: 2))
        )
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        false
    }
}
