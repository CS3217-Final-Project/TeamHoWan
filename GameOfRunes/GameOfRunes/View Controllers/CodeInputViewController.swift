//
//  CodeInputViewController.swift
//  GameOfRunes
//
//  Created by Andy on 4/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Foundation
import UIKit

class CodeInputViewController: UIViewController, UITextFieldDelegate {
    var codeInput = UITextField()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setUpCodeInputField()
    }

    // TODO: Make it look better. Probably include number pad for better aesthetics
    private func setUpCodeInputField() {
        codeInput.font = UIFont(name: GameConfig.fontName, size: 50)
        codeInput.minimumFontSize = 50
        codeInput.textColor = .white
        codeInput.backgroundColor = .black
        codeInput.textAlignment = .center
        codeInput.placeholder = "Enter room code here"
        codeInput.keyboardType = .numberPad
        codeInput.delegate = self
        view.addSubview(codeInput)
        view.bringSubviewToFront(codeInput)
        
        codeInput.snp.makeConstraints { make in
            make.centerX.equalToSuperview().labeled("inputButtonCenterX")
            make.centerY.equalToSuperview().multipliedBy(0.75).labeled("inputButtonCenterY")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let maxLength = 6
        let currentString = textField.text! as NSString
        let newString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
